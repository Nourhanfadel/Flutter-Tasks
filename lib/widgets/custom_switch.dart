import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final String title;
  final Function(bool) onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Switch(
            value: value,
            onChanged: onChanged,
          ),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
