import 'package:flutter/material.dart';

class BloodBadge extends StatelessWidget {
  const BloodBadge({super.key, required this.group});

  final String group;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(.10),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        group,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
