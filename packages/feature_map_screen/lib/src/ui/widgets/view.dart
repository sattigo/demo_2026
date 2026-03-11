import 'package:feature_map_screen/src/ui/bloc/bloc.build.dart';
import 'package:feature_map_screen/src/ui/widgets/coordinator.dart';
import 'package:feature_map_screen/src/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapScreenView extends StatelessWidget {
  const MapScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapScreenBloc(),
      child: const MapScreenCoordinator(child: MapScreenWidget()),
    );
  }
}
