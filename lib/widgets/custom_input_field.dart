import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool obscureText;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final String? label;
  final bool isPassword;



   CustomInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    required this.prefixIcon,
    this.label,

  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword,
      validator: widget.validator,

      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, ),
        prefixIcon: widget.prefixIcon,
        suffixIcon:
              widget.isPassword
                  ? IconButton(
                    onPressed: () {
                      print("switch obscure text");
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    },
                    icon:
                        widget.obscureText
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye),
                  )
                  : widget.suffixIcon,

       
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        labelText: widget.label,
      ),
    );
  }
}
