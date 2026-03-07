import 'package:feature_landing_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreenWidget extends StatefulWidget {
  const LandingScreenWidget({super.key});

  @override
  State<LandingScreenWidget> createState() => _LandingScreenWidgetState();
}

class _LandingScreenWidgetState extends State<LandingScreenWidget> {
  late final PageController _pageController;

  static const _slides = [
    _SlideData(title: 'Welcome', description: 'Discover amazing recipes from around the world.'),
    _SlideData(title: 'Cook Together', description: 'Share your favourite dishes with the community.'),
    _SlideData(title: "Let's Start", description: 'Sign in and begin your culinary journey today.'),
  ];

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

  Future<void> _animateToPage(int page) async {
    if (_pageController.hasClients) {
      await _pageController.animateToPage(page, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LandingScreenBloc, LandingScreenState>(
      listenWhen: (previous, current) => previous.currentPage != current.currentPage,
      listener: (context, state) => _animateToPage(state.currentPage),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _slides.length,
                  onPageChanged: (page) =>
                      BlocProvider.of<LandingScreenBloc>(context).add(LandingScreenEvent.pageChanged(page)),
                  itemBuilder: (context, index) => _SlidePage(slide: _slides[index]),
                ),
              ),
              BlocBuilder<LandingScreenBloc, LandingScreenState>(
                builder: (context, state) => _DotsIndicator(
                  count: _slides.length,
                  currentIndex: state.currentPage,
                ),
              ),
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
          ),
        ),
      ),
    );
  }
}

class _SlidePage extends StatelessWidget {
  const _SlidePage({required this.slide});

  final _SlideData slide;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<_SlideData>('slide', slide));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const Icon(Icons.image, size: 64),
          ),
          const SizedBox(height: 32),
          Text(slide.title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          Text(slide.description, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  const _DotsIndicator({required this.count, required this.currentIndex});

  final int count;
  final int currentIndex;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('count', count))
      ..add(IntProperty('currentIndex', currentIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outlineVariant,
          ),
        );
      }),
    );
  }
}

class _SlideData {
  const _SlideData({required this.title, required this.description});

  final String title;
  final String description;
}
