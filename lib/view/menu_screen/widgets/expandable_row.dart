import 'package:flutter/material.dart';

class ExpandableRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isExpanded;
  final VoidCallback onTap;
  final Widget? expandedContent;

  const ExpandableRow({
    super.key,
    required this.icon,
    required this.text,
    required this.isExpanded,
    required this.onTap,
    this.expandedContent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(text),
          trailing: Icon(
            isExpanded ? Icons.arrow_circle_up : Icons.arrow_circle_down,
            color: isExpanded ? Colors.blue : Colors.grey,
          ),
          onTap: onTap,
        ),
        Container(
          padding: const EdgeInsets.only(left: 72.0, top: 8.0),
          child: expandedContent ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
