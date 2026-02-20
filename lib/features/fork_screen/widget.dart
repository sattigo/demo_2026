import 'package:flutter/material.dart';

class ForkScreenWidget extends StatelessWidget {
  const ForkScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fork screen widget')),
      body: const Center(child: Text('Centered text')),
    );
  }
}
