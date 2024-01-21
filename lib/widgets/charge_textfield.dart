import 'package:flutter/material.dart';

class ChargeTextField extends StatefulWidget {
  ChargeTextField(
      {super.key,
      this.label,
      this.icon,
      this.isPassword = false,
      this.validator,
      required this.controller});
  String? label = "";
  final IconData? icon;
  final bool isPassword;
  TextEditingController controller = TextEditingController();
  final String? Function(String? value)? validator;

  @override
  State<ChargeTextField> createState() => _ChargeTextFieldState();
}

class _ChargeTextFieldState extends State<ChargeTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            filled: true,
            fillColor: Colors.white,
            label: Text(widget.label!),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)));
  }
}
