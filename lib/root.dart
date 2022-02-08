import 'package:flutter/material.dart';
import 'package:unique_version2/auth/landing.dart';
import '../colors.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adventorFont = TextStyle(
      fontFamily: "adventor",
      color: AppColors.mediumGrayDark,
    );
    return MaterialApp(
      title: "Uniqiue App",
      theme: ThemeData(
        primaryColor: AppColors.blue,
        backgroundColor: AppColors.lightblue,
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.orange,
          textTheme: ButtonTextTheme.primary,
          shape: Border(),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: AppColors.darkBlue,
        ),
        textTheme: TextTheme(
          headline1: adventorFont.copyWith(color: AppColors.orange),
          button: adventorFont.copyWith(color: AppColors.darkBlue),
          headline4: adventorFont.copyWith(color: AppColors.mediumGray),
        ),
      ),
      home: LandingPage(),
    );
  }
}
