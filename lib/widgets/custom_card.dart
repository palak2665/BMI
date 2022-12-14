import 'package:flutter/material.dart';

class customCard extends StatelessWidget {
  customCard({
    required this.cardChild,
    required this.colour,
    this.onPress,
  });
  final Color colour;
  final Widget cardChild;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
