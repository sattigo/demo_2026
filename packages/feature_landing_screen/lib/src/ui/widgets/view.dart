import 'package:feature_landing_screen/src/domain/use_cases/fetch_slides_use_case.dart';
import 'package:feature_landing_screen/src/ui/bloc/bloc.build.dart';
import 'package:feature_landing_screen/src/ui/widgets/coordinator.dart';
import 'package:feature_landing_screen/src/ui/widgets/widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreenView extends StatelessWidget {
  const LandingScreenView({
    required FetchSlidesUseCase fetchSlidesUseCase,
    required void Function(BuildContext context) onNavigateToAuth,
    super.key,
  }) : _fetchSlidesUseCase = fetchSlidesUseCase,
       _onNavigateToAuth = onNavigateToAuth;

  final FetchSlidesUseCase _fetchSlidesUseCase;
  final void Function(BuildContext context) _onNavigateToAuth;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LandingScreenBloc(fetchSlidesUseCase: _fetchSlidesUseCase),
      child: LandingScreenCoordinator(onNavigateToAuth: _onNavigateToAuth, child: const LandingScreenWidget()),
    );
  }
}
