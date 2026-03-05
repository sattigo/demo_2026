import 'package:demo_2026/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForkScreenWidget extends StatelessWidget {
  const ForkScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).forkScreen_notClickable_original_appBarText)),
      body: Center(child: Text(S.of(context).forkScreen_notClickable_original_centerText)),
    );
  }
}
