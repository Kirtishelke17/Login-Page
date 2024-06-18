import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
