import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';

class MapScreenWidget extends StatelessWidget {
  const MapScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).forkScreen_notClickable_original_appBarText)),
      body: Center(child: Text(S.of(context).forkScreen_notClickable_original_centerText)),
    );
  }
}
