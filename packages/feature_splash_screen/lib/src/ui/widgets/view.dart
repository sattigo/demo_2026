import 'package:feature_splash_screen/src/ui/bloc/bloc.build.dart';
import 'package:feature_splash_screen/src/ui/widgets/coordinator.dart';
import 'package:feature_splash_screen/src/ui/widgets/widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({required void Function(BuildContext context) onNavigateToLanding, super.key})
    : _onNavigateToLanding = onNavigateToLanding;

  final void Function(BuildContext context) _onNavigateToLanding;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashScreenBloc(),
      child: SplashScreenCoordinator(onNavigateToLanding: _onNavigateToLanding, child: const SplashScreenWidget()),
    );
  }
}
