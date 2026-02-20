import 'package:demo_2026/feature/navigation/router/extension.dart';
import 'package:demo_2026/feature/screens/fork_screen/route.dart';
import 'package:demo_2026/generated/l10n.dart';
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
      appBar: AppBar(title: Text(S.of(context).initialScreen_notClickable_original_appBarText)),
      body: Center(
        child: MaterialButton(
          child: Text(S.of(context).initialScreen_clickable_original_toForkScreenButton),
          onPressed: () => _onButtonPressed(context),
        ),
      ),
    );
  }
}
