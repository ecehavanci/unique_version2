import 'package:flutter/material.dart';

import '../colors.dart';

class ToastContext extends StatelessWidget {
  final TextStyle? style;
  final String title;

  const ToastContext({Key? key, this.style, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.mediumGray,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: textTheme.subtitle1!.copyWith(color: AppColors.orange),
          ),
        ],
      ),
    );
  }
}
