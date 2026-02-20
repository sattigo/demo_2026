import 'package:demo_2026/features/fork_screen/route.dart';
import 'package:demo_2026/navigation/router/extension.dart';
import 'package:flutter/material.dart';

class InitialScreenWidget extends StatelessWidget {
  const InitialScreenWidget({super.key});

  Future<void> _onButtonPressed(BuildContext context) async {
    if (context.mounted) {
      await ForkScreenRoute().pushNamed(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Initial screen widget')),
      body: Center(
        child: MaterialButton(child: const Text('To "fork page"'), onPressed: () => _onButtonPressed(context)),
      ),
    );
  }
}
