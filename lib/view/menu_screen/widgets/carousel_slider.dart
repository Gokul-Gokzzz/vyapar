import 'package:flutter/material.dart';

class SimpleRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const SimpleRow({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: Icon(
        Icons.arrow_circle_right_outlined,
        color: Colors.grey, // Adjust color as needed
      ),
      onTap: onTap,
    );
  }
}