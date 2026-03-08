import 'dart:async';

import 'package:feature_landing_screen/src/ui/bloc/bloc.build.dart';
import 'package:feature_landing_screen/src/ui/widgets/dots_indicator.dart';
import 'package:feature_landing_screen/src/ui/widgets/slide_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreenWidget extends StatefulWidget {
  const LandingScreenWidget({super.key});

  @override
  State<LandingScreenWidget> createState() => _LandingScreenWidgetState();
}

class _LandingScreenWidgetState extends State<LandingScreenWidget> {
  late final PageController _pageController;
  int _previousPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    BlocProvider.of<LandingScreenBloc>(context).add(LandingScreenEvent.started());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _navigateToPage(int previousPage, int page) async {
    if (!_pageController.hasClients) {
      return;
    }
    final isWraparound = previousPage > page;
    if (isWraparound) {
      _pageController.jumpToPage(page);
    } else {
      await _pageController.animateToPage(page, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LandingScreenBloc, LandingScreenState>(
      listenWhen: (previous, current) => previous.currentPage != current.currentPage,
      listener: (context, state) {
        unawaited(_navigateToPage(_previousPage, state.currentPage));
        _previousPage = state.currentPage;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<LandingScreenBloc, LandingScreenState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final slides = state.slides ?? [];
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: slides.length,
                      onPageChanged: (page) =>
                          BlocProvider.of<LandingScreenBloc>(context).add(LandingScreenEvent.pageChanged(page)),
                      itemBuilder: (context, index) => SlidePage(slide: slides[index]),
                    ),
                  ),
                  DotsIndicator(count: slides.length, currentIndex: state.currentPage),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ElevatedButton(
                      onPressed: () =>
                          BlocProvider.of<LandingScreenBloc>(context).add(LandingScreenEvent.getStartedTapped()),
                      style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                      child: const Text('Get Started'),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
