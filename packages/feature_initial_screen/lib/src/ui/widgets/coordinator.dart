import 'package:feature_initial_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InitialScreenCoordinator extends StatefulWidget {
  const InitialScreenCoordinator({required Widget child, super.key}) : _child = child;

  final Widget _child;

  @override
  State<InitialScreenCoordinator> createState() => _InitialScreenCoordinatorState();
}

class _InitialScreenCoordinatorState extends State<InitialScreenCoordinator> {
  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      BlocProvider.of<InitialScreenBloc>(context).actions.listen(_initialScreenActionsListener);
    }
  }

  void _initialScreenActionsListener(InitialScreenAction action) {
    switch (action) {
      case InitialScreenActionSomeAction():
        FToast()
          ..init(context)
          ..showToast(child: const Text('some action was called'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget._child;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
