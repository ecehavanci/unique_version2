import 'package:flutter/material.dart';
import 'package:unique_version2/auth/signup.dart';
import 'package:unique_version2/widgets/custom_text_button.dart';
import 'package:unique_version2/widgets/custom_text_input.dart';
import 'package:unique_version2/widgets/sign_in_button.dart';
import '../colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isKeyOpen = false;
  TextEditingController mailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  Spacer(flex: 4),
                  Text(
                    "Welcome To Unique",
                    style: textTheme.subtitle1!.copyWith(fontSize: 30),
                  ),
                  Container(
                    child: Image(
                      width: width * 0.45,
                      image: AssetImage('asset/human_pet.png'),
                      fit: BoxFit.fill, //fill type of image inside aspectRatio
                    ),
                  ),
                  //Spacer(flex: 2),
                  Expanded(
                    flex: 20,
                    child: Container(
                      width: width,
                      height: height * 0.70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100)),
                        color: AppColors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: height * 0.03),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.1,
                                ),
                                child: Text(
                                  "Sign In",
                                  style: textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.15, bottom: 10),
                                child: Text(
                                  "Email",
                                  style: textTheme.headline4!.copyWith(
                                    color: AppColors.mediumGray,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.1,
                                right: width * 0.1,
                                bottom: height * 0.03,
                              ),
                              child: CustomTextInput(
                                label: 'email',
                                controller: mailController,
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.email),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.15, bottom: 10),
                                child: Text(
                                  "Password",
                                  style: textTheme.headline4!.copyWith(
                                    color: AppColors.mediumGray,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.1,
                                right: width * 0.1,
                              ),
                              child: CustomTextInput(
                                label: 'password',
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.vpn_key)),
                                suffixIcon: IconButton(
                                  icon: isKeyOpen
                                      ? Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.grey,
                                        )
                                      : Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.blue,
                                        ),
                                  onPressed: () {
                                    print(isKeyOpen);
                                    setState(() {
                                      isKeyOpen = !isKeyOpen;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            SignInButton(
                              title: "Sign In",
                              width: width * 0.40,
                              height: 50,
                              onPressed: () {
                                print("go to home page");
                              },
                              color: AppColors.yellow,
                              textStyle: textTheme.button!.copyWith(
                                color: AppColors.orange,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            Text(
                              "Not a member? Join us now!",
                              style: textTheme.subtitle1,
                            ),
                            CustomTextButton(
                              title: "Sign Up",
                              style:
                                  textTheme.subtitle1!.copyWith(color: AppColors.orange, fontWeight: FontWeight.bold),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                              },
                            ),
                            SizedBox(height: height * 0.03),
                          ],
                        ),
                      ),
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
