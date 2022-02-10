import 'package:flutter/material.dart';
import 'package:unique_version2/widgets/custom_text_input.dart';
import 'package:unique_version2/widgets/sign_in_button.dart';
import '../colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController mailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final themeData = Theme.of(context).backgroundColor;
    return Scaffold(
      body: Container(
        color: themeData,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => Center(
              child: Column(
                children: [
                  Spacer(flex: 3),
                  Text(
                    "Welcome To Unique",
                    style: textTheme.subtitle1!.copyWith(fontSize: 30),
                  ),
                  Spacer(flex: 2),
                  Container(
                    width: width,
                    height: height * 0.70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100)),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.1,
                            ),
                            child: Text(
                              "Sign In",
                              style: textTheme.bodyText1!.copyWith(fontSize: 24),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.1,
                            right: width * 0.1,
                          ),
                          child: CustomTextInput(
                            label: 'email',
                            controller: mailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.1,
                            right: width * 0.1,
                          ),
                          child: CustomTextInput(
                            label: 'password',
                            controller: mailController,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        SignInButton(
                          title: "Sign In",
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          "Not a member? Join us now!",
                          style: textTheme.subtitle1,
                        ),
                        Spacer(flex: 1,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
