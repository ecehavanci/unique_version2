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
        backgroundColor: AppColors.bej,
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.orange,
          textTheme: ButtonTextTheme.primary,
          shape: Border(),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: AppColors.darkBlue,
        ),
        textTheme: TextTheme(
          headline1: adventorFont.copyWith(color: AppColors.darkBlue, fontSize: 24),
          headline2: adventorFont.copyWith(color: AppColors.darkBlue, fontSize: 22),
          headline3: adventorFont.copyWith(color: AppColors.darkBlue, fontSize: 20),
          headline4: adventorFont.copyWith(color: AppColors.darkBlue, fontSize: 18),
          headline5: adventorFont.copyWith(color: AppColors.darkBlue, fontSize: 16),
          headline6: adventorFont.copyWith(color: AppColors.darkBlue, fontSize: 14),
          button: adventorFont.copyWith(color: AppColors.orange2),
          bodyText1: adventorFont.copyWith(color: AppColors.orange),
          bodyText2: adventorFont.copyWith(color: AppColors.blue),
          subtitle1: adventorFont.copyWith(color: AppColors.lightblue),
          subtitle2: adventorFont.copyWith(color: AppColors.yellow),
        ),
      ),
      home: LandingPage(),
    );
  }
}
