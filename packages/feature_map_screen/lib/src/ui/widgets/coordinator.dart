import 'package:feature_map_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MapScreenCoordinator extends StatefulWidget {
  const MapScreenCoordinator({required Widget child, super.key}) : _child = child;

  final Widget _child;

  @override
  State<MapScreenCoordinator> createState() => _MapScreenCoordinatorState();
}

class _MapScreenCoordinatorState extends State<MapScreenCoordinator> {
  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      BlocProvider.of<MapScreenBloc>(context).actions.listen(_actionsListener);
    }
  }

  void _actionsListener(MapScreenAction action) {
    switch (action) {
      case MapScreenActionSomeAction():
        FToast()
          ..init(context)
          ..showToast(child: const Text('some action was called'));
    }
  }

  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void dispose() {
    super.dispose();
  }
}
