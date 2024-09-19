import 'package:flutter/material.dart';

class SubRow extends StatelessWidget {
  final String text;
  final IconData trailingIcon;
  final VoidCallback? onPressed;

  const SubRow({
    required this.text,
    required this.trailingIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.black87),
            ),
          ),
          IconButton(
            icon: Icon(
              trailingIcon,
              color: Colors.grey, // Adjust color as needed
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}