import 'dart:async';

import 'package:core_navigation/core_navigation.dart';
import 'package:feature_landing_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreenCoordinator extends StatefulWidget {
  const LandingScreenCoordinator({required Widget child, required String authRouteName, super.key})
    : _child = child,
      _authRouteName = authRouteName;

  final Widget _child;
  final String _authRouteName;

  @override
  State<LandingScreenCoordinator> createState() => _LandingScreenCoordinatorState();
}

class _LandingScreenCoordinatorState extends State<LandingScreenCoordinator> {
  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      BlocProvider.of<LandingScreenBloc>(context).actions.listen(_actionsListener);
    }
  }

  void _actionsListener(LandingScreenAction action) {
    switch (action) {
      case LandingScreenActionNavigateToAuth():
        if (context.mounted) {
          unawaited(context.pushNamed<void>(widget._authRouteName));
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
