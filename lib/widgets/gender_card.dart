import 'package:flutter/material.dart';

class genderCard extends StatelessWidget {
  const genderCard({
    Key? key,
    required this.gender,
    required this.icon,
  }) : super(key: key);
  final String gender;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 80,
      ),
      const SizedBox(
        height: 15.0,
      ),
      Text(
        gender,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      )
    ]);
  }
}
