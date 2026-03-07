import 'package:feature_home_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreenCoordinator extends StatefulWidget {
  const HomeScreenCoordinator({required Widget child, super.key}) : _child = child;

  final Widget _child;

  @override
  State<HomeScreenCoordinator> createState() => _HomeScreenCoordinatorState();
}

class _HomeScreenCoordinatorState extends State<HomeScreenCoordinator> {
  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      BlocProvider.of<HomeScreenBloc>(context).actions.listen(_initialScreenActionsListener);
    }
  }

  void _initialScreenActionsListener(HomeScreenAction action) {
    switch (action) {
      case HomeScreenActionSomeAction():
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
