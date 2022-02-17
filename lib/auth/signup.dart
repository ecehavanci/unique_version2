import 'package:flutter/material.dart';
import 'package:unique_version2/init/pet_owner_home.dart';
import 'package:unique_version2/widgets/custom_text_button.dart';
import 'package:unique_version2/widgets/custom_text_input.dart';
import 'package:unique_version2/widgets/sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/toastMessage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late FToast fToast;
  bool isKeyOpen = false;
  TextEditingController mailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  late final String uid;

  var _email;
  var _name;
  var _phone;
  var _password;

  Future<void> _register() async {
    UserCredential newUser;
    if (formKey.currentState!.validate()) {
      try {
        newUser = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mailController.text, password: passwordController.text);
        uid = newUser.user!.uid;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(uid: uid)));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _showToast("The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          _showToast("The account already exists for that email.");
        }
      } catch (e) {
        print(e);
        _showToast(e.toString());
      }

    }
    else
      _showToast("Fill the necessary inputs");

    setState(() {
      isLoading = false;
    });


  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(errorMessage) {
    fToast.showToast(
      child: ToastContext(
        title: errorMessage,
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 4),
    );
  }

  @override
  void dispose() {
    mailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

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
              child: isLoading
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(
                          "Sign Up",
                          style: textTheme.subtitle1!.copyWith(fontSize: 24),
                        ),
                        Text(
                          "Create a new account and find your pet's needs",
                          style: textTheme.subtitle1!.copyWith(fontSize: 13),
                        ),
                        Container(
                          child: Image(
                            width: width * 0.45,
                            image: AssetImage('asset/human_pet_game.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: width,
                            height: height * 0.70,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100)),
                              color: AppColors.white,
                            ),
                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    SizedBox(height: height * 0.03),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: width * 0.15, bottom: 10),
                                        child: Text(
                                          "Name",
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
                                        onSaved: (input) {
                                          _name = input;
                                        },
                                        label: 'name',
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Name';
                                          }
                                          return null;
                                        },
                                        controller: nameController,
                                        keyboardType: TextInputType.name,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Icon(Icons.account_circle_rounded),
                                        ),
                                      ),
                                    ),
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
                                        onSaved: (input) {
                                          _email = input;
                                        },
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Email';
                                          }
                                          return null;
                                        },
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
                                          "Phone",
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
                                        onSaved: (input) {
                                          _phone = input;
                                        },
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Phone';
                                          }
                                          return null;
                                        },
                                        label: 'phone',
                                        controller: phoneController,
                                        keyboardType: TextInputType.phone,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Icon(Icons.phone),
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
                                        onSaved: (input) {
                                          _password = input;
                                        },
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Password';
                                          }
                                          return null;
                                        },
                                        label: 'password',
                                        controller: passwordController,
                                        keyboardType: TextInputType.visiblePassword,
                                        prefixIcon:
                                            Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.vpn_key)),
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
                                      title: "Sign Up",
                                      width: width * 0.40,
                                      height: 50,
                                      onPressed: () {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        _register();
                                      },
                                      color: AppColors.lightblue,
                                      textStyle: textTheme.button!.copyWith(
                                        color: AppColors.orange,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.03),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already have an account? ",
                                          style: textTheme.subtitle1,
                                        ),
                                        CustomTextButton(
                                          title: "Sign in Now!",
                                          style: textTheme.subtitle1!
                                              .copyWith(color: AppColors.orange, fontWeight: FontWeight.bold),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    //SizedBox(height: height*0.05),
                                  ],
                                ),
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
