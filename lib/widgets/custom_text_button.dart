import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final TextStyle? style;

  const CustomTextButton({Key? key, required this.onPressed, required this.title, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(title, style: style));
  }
}
