import 'package:flutter/material.dart';
import 'package:unique_version2/colors.dart';

class CustomTextInput extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String label;
  final onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final double? radius;

  CustomTextInput(
      {Key? key,
      required this.label,
      this.validator,
      this.onChanged,
      this.onSaved,
      required this.keyboardType,
      required this.controller,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.errorText,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      keyboardType: keyboardType,
      controller: controller,
      autocorrect: true,
      maxLines: 1,
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(20))),
        hintText: "hint",
        hintStyle: TextStyle(color: AppColors.mediumGrayLight),
        //errorText: errorText,
        prefixIcon: Icon(Icons.email),
        suffixIcon: Icon(Icons.add),
        //labelText: label,
      ),
    );
  }
}
