import 'package:flutter/material.dart';
import 'package:unique_version2/colors.dart';

class SignInButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? textColor;
  final BorderRadius? radius;
  final double? elevation;
  final double? borderWidth;
  final double? height;
  final double? width;
  final void Function() onPressed;
  final TextStyle textStyle;

  const SignInButton({
    Key? key,
    required this.title,
    this.color,
    this.textColor,
    this.radius,
    this.elevation,
    this.borderWidth: 8,
    this.height,
    this.width,
    required this.onPressed,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          //minimumSize: Size(50, height ?? 50),
          primary: color ?? AppColors.lightblue,
          elevation: elevation,
          //side: BorderSide(width: borderWidth ?? 0),
          shape: RoundedRectangleBorder(
            borderRadius: radius ?? BorderRadius.circular(100.0),
          ),
        ),
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
