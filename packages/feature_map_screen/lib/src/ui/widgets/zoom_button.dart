import 'package:flutter/material.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({required IconData icon, required void Function() onTap, super.key}) : _onTap = onTap, _icon = icon;

  final IconData _icon;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 42,
      child: Material(
        color: Colors.grey[200],
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: _onTap,
          child: Icon(_icon, color: Colors.black, size: 20),
        ),
      ),
    );
  }
}
