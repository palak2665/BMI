// ignore: file_names
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: Theme.of(context).splashColor,
      child: Icon(icon),
    );
  }
}
