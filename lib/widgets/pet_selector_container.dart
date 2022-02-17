import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';

class PetSelectorContainer extends StatelessWidget {
  final String iconAsset;
  final double? height;
  final double? width;
  final double? containerHeight;
  final double? containerWidth;
  final void Function() onPressed;
  final String animalTitle;

  const PetSelectorContainer(
      {Key? key,
      required this.iconAsset,
      this.height,
      this.width,
      this.containerHeight,
      this.containerWidth,
      required this.onPressed,
      required this.animalTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: containerWidth,
      height: containerHeight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: AppColors.bej,
                primary: AppColors.lightblue2,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              onPressed: onPressed,
              child: Image.asset(iconAsset, width: width, height: height),
            ),
          ),
          Text(
            animalTitle,
            style: textTheme.subtitle1!.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.darkblue2),
          )
        ],
      ),
    );
  }
}
