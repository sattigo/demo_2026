import 'package:feature_landing_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreenCoordinator extends StatefulWidget {
  const LandingScreenCoordinator({
    required Widget child,
    required void Function(BuildContext context) onNavigateToAuth,
    super.key,
  }) : _child = child,
       _onNavigateToAuth = onNavigateToAuth;

  final Widget _child;
  final void Function(BuildContext context) _onNavigateToAuth;

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
          widget._onNavigateToAuth(context);
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
