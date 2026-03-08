import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({required int count, required int currentIndex, super.key})
    : _count = count,
      _currentIndex = currentIndex;

  final int _count;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_count, (index) {
        final isActive = index == _currentIndex;
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
