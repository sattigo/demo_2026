import 'dart:math';
import 'dart:ui';

import 'package:demo_2026/navigation/ui/transitions/base_transition_contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

const double _kBackGestureWidth = 20;
const double _kMinFlingVelocity = 1; // Screen widths per second.

// An eyeballed value for the maximum time it takes for a page to animate forward
// if the user releases a page mid swipe.
const int _kMaxDroppedSwipePageForwardAnimationTime = 800; // Milliseconds.

// The maximum time for a page to get reset to it's original position if the
// user releases a page mid swipe.
const int _kMaxPageBackAnimationTime = 300; // Milliseconds.

class BaseCupertinoPageRoute extends CupertinoPageRoute<dynamic> {
  BaseCupertinoPageRoute({
    required this.transition,
    required super.builder,
    super.settings,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  ValueListenable<String> get previousTitle {
    return ValueNotifier<String>('');
  }

  final Duration duration;
  final BaseTransitionContract transition;

  static bool isPopGestureInProgress(PageRoute<dynamic> route) {
    return route.navigator!.userGestureInProgress;
  }

  static bool _isPopGestureEnabled<T>(PageRoute<T> route) {
    // If there's nothing to go back to, then obviously we don't support
    // the back gesture.
    if (route.isFirst) {
      return false;
    }
    // If the route wouldn't actually pop if we popped it, then the gesture
    // would be really confusing (or would skip internal routes), so disallow it.
    if (route.willHandlePopInternally) {
      return false;
    }
    // If attempts to dismiss this route might be vetoed such as in a page
    // with forms, then do not allow the user to dismiss the route with a swipe.
    if (route.popDisposition == RoutePopDisposition.doNotPop) {
      return false;
    }
    // Fullscreen dialogs aren't dismissible by back swipe.
    if (route.fullscreenDialog) {
      return false;
    }
    // If we're in an animation already, we cannot be manually swiped.
    if (route.animation!.status != AnimationStatus.completed) {
      return false;
    }
    // If we're being popped into, we also cannot be swiped until the pop above
    // it completes. This translates to our secondary animation being
    // dismissed.
    if (route.secondaryAnimation!.status != AnimationStatus.dismissed) {
      return false;
    }
    // If we're in a gesture already, we cannot start another.
    if (isPopGestureInProgress(route)) {
      return false;
    }

    // Looks like a back gesture would be welcome!
    return true;
  }

  static _CupertinoBackGestureController<T> _startPopGesture<T>(PageRoute<T> route) {
    assert(_isPopGestureEnabled(route), 'Должен быть разрешен жест возврата назад для данного маршрута.');

    return _CupertinoBackGestureController<T>(
      navigator: route.navigator!,
      controller: route.controller!, // protected access
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return _CupertinoBackGestureDetector(
      enabledCallback: () => _isPopGestureEnabled(this),
      onStartPopGesture: () => _startPopGesture(this),
      child: isPopGestureInProgress(this)
          ? CupertinoPageTransition(
        primaryRouteAnimation: animation,
        secondaryRouteAnimation: secondaryAnimation,
        linearTransition: true,
        child: child,
      )
          : transition.animate(context, animation, secondaryAnimation, child),
    );
  }

  @override
  Duration get transitionDuration => duration;
}

class _CupertinoBackGestureDetector<T> extends StatefulWidget {
  const _CupertinoBackGestureDetector({
    required bool Function() enabledCallback,
    required _CupertinoBackGestureController<T> Function() onStartPopGesture,
    required this.child,
    super.key,
  }) : _onStartPopGesture = onStartPopGesture,
        _enabledCallback = enabledCallback;

  final Widget child;

  final ValueGetter<bool> _enabledCallback;

  final ValueGetter<_CupertinoBackGestureController<T>> _onStartPopGesture;

  @override
  _CupertinoBackGestureDetectorState<T> createState() => _CupertinoBackGestureDetectorState<T>();
}

class _CupertinoBackGestureDetectorState<T> extends State<_CupertinoBackGestureDetector<T>> {
  _CupertinoBackGestureController<T>? _backGestureController;

  late HorizontalDragGestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
    _recognizer = HorizontalDragGestureRecognizer(debugOwner: this)
      ..onStart = _handleDragStart
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd
      ..onCancel = _handleDragCancel;
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  void _handleDragStart(DragStartDetails details) {
    assert(mounted, 'Должно быть mounted');
    assert(_backGestureController == null, 'backGestureController не должен быть null');
    _backGestureController = widget._onStartPopGesture();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    assert(mounted, 'Должно быть mounted');
    assert(_backGestureController != null, 'backGestureController не должен быть null');
    _backGestureController!.dragUpdate(_convertToLogical(details.primaryDelta! / context.size!.width));
  }

  void _handleDragEnd(DragEndDetails details) {
    assert(mounted, 'Должно быть mounted');
    assert(_backGestureController != null, 'backGestureController не должен быть null');
    _backGestureController!.dragEnd(_convertToLogical(details.velocity.pixelsPerSecond.dx / context.size!.width));
    _backGestureController = null;
  }

  void _handleDragCancel() {
    assert(mounted, 'Должно быть mounted');
    // This can be called even if start is not called, paired with the "down" event
    // that we don't consider here.
    _backGestureController?.dragEnd(0);
    _backGestureController = null;
  }

  void _handlePointerDown(PointerDownEvent event) {
    if (widget._enabledCallback()) {
      _recognizer.addPointer(event);
    }
  }

  double _convertToLogical(double value) {
    switch (Directionality.of(context)) {
      case TextDirection.rtl:
        return -value;
      case TextDirection.ltr:
        return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasDirectionality(context), 'Виджет должен вызываться только в соответствующем контексте');
    // For devices with notches, the drag area needs to be larger on the side
    // that has the notch.
    var dragAreaWidth = Directionality.of(context) == TextDirection.ltr
        ? MediaQuery.of(context).padding.left
        : MediaQuery.of(context).padding.right;
    dragAreaWidth = max(dragAreaWidth, _kBackGestureWidth);
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        widget.child,
        PositionedDirectional(
          start: 0,
          width: dragAreaWidth,
          top: 0,
          bottom: 0,
          child: Listener(onPointerDown: _handlePointerDown, behavior: HitTestBehavior.translucent),
        ),
      ],
    );
  }
}

class _CupertinoBackGestureController<T> {
  /// Creates a controller for an iOS-style back gesture.
  ///
  /// The [navigator] and [controller] arguments must not be null.
  _CupertinoBackGestureController({required this.navigator, required this.controller}) {
    navigator.didStartUserGesture();
  }

  final AnimationController controller;
  final NavigatorState navigator;

  /// The drag gesture has changed by [delta]. The total range of the
  /// drag should be 0.0 to 1.0.
  void dragUpdate(double delta) {
    controller.value -= delta;
  }

  /// The drag gesture has ended with a horizontal motion of
  /// [velocity] as a fraction of screen width per second.
  void dragEnd(double velocity) {
    // Fling in the appropriate direction.
    // AnimationController.fling is guaranteed to
    // take at least one frame.
    //
    // This curve has been determined through rigorously eyeballing native iOS
    // animations.
    const Curve animationCurve = Curves.fastLinearToSlowEaseIn;
    bool animateForward;

    // If the user releases the page before mid screen with sufficient velocity,
    // or after mid screen, we should animate the page out. Otherwise, the page
    // should be animated back in.
    if (velocity.abs() >= _kMinFlingVelocity) {
      animateForward = velocity <= 0;
    } else {
      animateForward = controller.value > 0.5;
    }

    if (animateForward) {
      // The closer the panel is to dismissing, the shorter the animation is.
      // We want to cap the animation time, but we want to use a linear curve
      // to determine it.
      final droppedPageForwardAnimationTime = min(
        lerpDouble(_kMaxDroppedSwipePageForwardAnimationTime, 0, controller.value)!.floor(),
        _kMaxPageBackAnimationTime,
      );
      controller.animateTo(
        1,
        duration: Duration(milliseconds: droppedPageForwardAnimationTime),
        curve: animationCurve,
      );
    } else {
      // This route is destined to pop at this point. Reuse navigator's pop.
      navigator.pop();

      // The popping may have finished inline if already at the target destination.
      if (controller.isAnimating) {
        // Otherwise, use a custom popping animation duration and curve.
        final droppedPageBackAnimationTime = lerpDouble(
          0,
          _kMaxDroppedSwipePageForwardAnimationTime,
          controller.value,
        )!.floor();
        controller.animateBack(
          0,
          duration: Duration(milliseconds: droppedPageBackAnimationTime),
          curve: animationCurve,
        );
      }
    }

    if (controller.isAnimating) {
      // Keep the userGestureInProgress in true state so we don't change the
      // curve of the page transition mid-flight since CupertinoPageTransition
      // depends on userGestureInProgress.
      late AnimationStatusListener animationStatusCallback;
      animationStatusCallback = (status) {
        navigator.didStopUserGesture();
        controller.removeStatusListener(animationStatusCallback);
      };
      controller.addStatusListener(animationStatusCallback);
    } else {
      navigator.didStopUserGesture();
    }
  }
}
