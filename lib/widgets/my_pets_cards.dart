import 'package:flutter/material.dart';
import 'package:unique_version2/colors.dart';

class PetCard extends StatelessWidget {
  final String url;
  final String? petName;
  final String? petBreed;
  final String? petAge;
  final double screenWidth;
  final double screenHeight;

  const PetCard(
      {Key? key,
      required this.url,
      this.petName,
      this.petBreed,
      this.petAge,
      required this.screenWidth,
      required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      overflow: Overflow.clip,
      alignment: Alignment.centerLeft,
      // clipBehavior: Clip.,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: screenHeight * 0.15,
          width: screenWidth * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: screenWidth * 0.7,
              height: screenHeight * 0.12,
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              decoration: BoxDecoration(
                // border: Border.all(width: 0.6),
                color: Colors.blue,
                gradient: new LinearGradient(
                    stops: [0.3, 0.9],
                    colors: [AppColors.lightblue2.withOpacity(0), AppColors.lightblue.withOpacity(0.1)]),
                borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(petName ?? "Name not specified",
                        style: textTheme.subtitle1!
                            .copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.darkblue2)),
                    Text(
                      petBreed ?? "Breed not specified",
                      style: textTheme.subtitle1!.copyWith(fontSize: 12, color: AppColors.mediumGray),
                    ),
                    Text(
                      petAge ?? "Age is not specified",
                      style: textTheme.subtitle1!.copyWith(fontSize: 12, color: AppColors.mediumGray),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
