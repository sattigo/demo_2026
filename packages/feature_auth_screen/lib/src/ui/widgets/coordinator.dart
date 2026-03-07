import 'package:feature_auth_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreenCoordinator extends StatefulWidget {
  const AuthScreenCoordinator({
    required Widget child,
    required void Function(BuildContext context) onNavigateToHome,
    super.key,
  }) : _child = child,
       _onNavigateToHome = onNavigateToHome;

  final Widget _child;
  final void Function(BuildContext context) _onNavigateToHome;

  @override
  State<AuthScreenCoordinator> createState() => _AuthScreenCoordinatorState();
}

class _AuthScreenCoordinatorState extends State<AuthScreenCoordinator> {
  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      BlocProvider.of<AuthScreenBloc>(context).actions.listen(_actionsListener);
    }
  }

  void _actionsListener(AuthScreenAction action) {
    switch (action) {
      case AuthScreenActionNavigateToHome():
        if (context.mounted) {
          widget._onNavigateToHome(context);
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
