import 'package:demo_2026/feature/screens/initial_screen/bloc/bloc.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/ui/coordinator.dart';
import 'package:demo_2026/feature/screens/initial_screen/ui/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialScreenView extends StatelessWidget {
  const InitialScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => InitialScreenBloc(),
      child: const InitialScreenCoordinator(child: InitialScreenWidget()),
    );
  }
}
