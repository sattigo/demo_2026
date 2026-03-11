import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';

class RouteButton extends StatelessWidget {
  const RouteButton({required void Function() onTap, super.key}) : _onTap = onTap;

  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _onTap, child: Text(S.of(context).mapScreen_clickable_original_buildRouteButton));
  }
}
