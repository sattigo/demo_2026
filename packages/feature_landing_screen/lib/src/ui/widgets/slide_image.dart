import 'package:flutter/material.dart';

class SlideImage extends StatelessWidget {
  const SlideImage({required Uri? imageUrl, super.key}) : _imageUrl = imageUrl;

  final Uri? _imageUrl;

  @override
  Widget build(BuildContext context) {
    final url = _imageUrl;
    return SizedBox(
      width: 200,
      height: 200,
      child: url != null
          ? Image.network(
              url.toString(),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _placeholder(context),
            )
          : _placeholder(context),
    );
  }

  Widget _placeholder(BuildContext context) {
    return ColoredBox(color: Theme.of(context).colorScheme.primaryContainer, child: const Icon(Icons.image, size: 64));
  }
}
