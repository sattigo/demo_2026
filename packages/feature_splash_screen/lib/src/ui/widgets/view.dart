import 'package:feature_splash_screen/src/ui/bloc/bloc.build.dart';
import 'package:feature_splash_screen/src/ui/widgets/coordinator.dart';
import 'package:feature_splash_screen/src/ui/widgets/widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({required String landingRouteName, super.key}) : _landingRouteName = landingRouteName;

  final String _landingRouteName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashScreenBloc(),
      child: SplashScreenCoordinator(landingRouteName: _landingRouteName, child: const SplashScreenWidget()),
    );
  }
}
