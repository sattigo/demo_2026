import 'dart:async';

import 'package:feature_splash_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    BlocProvider.of<SplashScreenBloc>(context).add(SplashScreenEvent.started());
    _runFadeIn();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runFadeIn() {
    _controller.reset();
    unawaited(
      _controller
          .forward()
          .whenComplete(() => BlocProvider.of<SplashScreenBloc>(context).add(SplashScreenEvent.fadeInCompleted())),
    );
  }

  void _runFadeOut() {
    _controller.reset();
    unawaited(
      _controller
          .reverse(from: 1)
          .whenComplete(() => BlocProvider.of<SplashScreenBloc>(context).add(SplashScreenEvent.fadeOutCompleted())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listenWhen: (previous, current) => previous.phase != current.phase,
      listener: (context, state) {
        switch (state.phase) {
          case SplashAnimationPhase.fadeOut:
            _runFadeOut();
          case SplashAnimationPhase.fadeIn:
          case SplashAnimationPhase.hold:
          case SplashAnimationPhase.done:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Opacity(
              opacity: _controller.value,
              child: child,
            ),
            child: const Icon(Icons.restaurant, size: 120),
          ),
        ),
      ),
    );
  }
}
