import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final int divisions;
  final Function(double) onChanged;
  final String? label;

   const CustomSlider({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
    this.label,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Slider(
            value: widget.value,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            label: widget.value.toStringAsFixed(2),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
