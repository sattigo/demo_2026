import 'package:feature_landing_screen/src/domain/use_cases/fetch_slides_use_case.dart';
import 'package:feature_landing_screen/src/ui/bloc/bloc.build.dart';
import 'package:feature_landing_screen/src/ui/widgets/coordinator.dart';
import 'package:feature_landing_screen/src/ui/widgets/widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreenView extends StatelessWidget {
  const LandingScreenView({required FetchSlidesUseCase fetchSlidesUseCase, required String authRouteName, super.key})
    : _fetchSlidesUseCase = fetchSlidesUseCase,
      _authRouteName = authRouteName;

  final FetchSlidesUseCase _fetchSlidesUseCase;
  final String _authRouteName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LandingScreenBloc(fetchSlidesUseCase: _fetchSlidesUseCase),
      child: LandingScreenCoordinator(authRouteName: _authRouteName, child: const LandingScreenWidget()),
    );
  }
}
