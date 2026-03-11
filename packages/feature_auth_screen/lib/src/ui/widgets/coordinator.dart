import 'package:core_navigation/core_navigation.dart';
import 'package:feature_auth_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreenCoordinator extends StatefulWidget {
  const AuthScreenCoordinator({required Widget child, required String homeRouteName, super.key})
    : _child = child,
      _homeRouteName = homeRouteName;

  final Widget _child;
  final String _homeRouteName;

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
          context.goNamed(widget._homeRouteName);
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
