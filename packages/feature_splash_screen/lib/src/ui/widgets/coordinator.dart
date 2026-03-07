import 'package:feature_splash_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenCoordinator extends StatefulWidget {
  const SplashScreenCoordinator({
    required Widget child,
    required void Function(BuildContext context) onNavigateToLanding,
    super.key,
  }) : _child = child,
       _onNavigateToLanding = onNavigateToLanding;

  final Widget _child;
  final void Function(BuildContext context) _onNavigateToLanding;

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
          widget._onNavigateToLanding(context);
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
