import 'dart:async';

import 'package:core_navigation/core_navigation.dart';
import 'package:feature_splash_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenCoordinator extends StatefulWidget {
  const SplashScreenCoordinator({required Widget child, required String landingRouteName, super.key})
    : _child = child,
      _landingRouteName = landingRouteName;

  final Widget _child;
  final String _landingRouteName;

  @override
  State<SplashScreenCoordinator> createState() => _SplashScreenCoordinatorState();
}

class _SplashScreenCoordinatorState extends State<SplashScreenCoordinator> {
  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      BlocProvider.of<SplashScreenBloc>(context).actions.listen(_actionsListener);
    }
  }

  void _actionsListener(SplashScreenAction action) {
    switch (action) {
      case SplashScreenActionNavigateToLanding():
        if (context.mounted) {
          unawaited(context.pushNamed<void>(widget._landingRouteName));
        }
    }
  }

  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void dispose() {
    super.dispose();
  }
}
