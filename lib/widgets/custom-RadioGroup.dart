import 'package:flutter/material.dart';

class CustomRadioGroup extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selectedValue;
  final Function(String?) onChanged;

  const CustomRadioGroup({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...options.map(
            (option) => RadioListTile(
              value: option,
              groupValue: selectedValue,
              title: Text(option),
              contentPadding: EdgeInsets.zero,
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
