import 'package:faith_breed/DB/authentications.dart';
import 'package:faith_breed/shared_widget/dont_have_an_account.dart';
import 'package:faith_breed/shared_widget/image_asset.dart';
import 'package:faith_breed/shared_widget/signup_button.dart';
import 'package:faith_breed/shared_widget/text_field.dart';
import 'package:faith_breed/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // loading spinner
  bool showSpinner = false;
  bool _isHidden = true;
  FirebaseAuth firebase = FirebaseAuth.instance;
  void togglePasswordVisibility() => setState(() => _isHidden = !_isHidden);
  // form key for user input validation
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  //text controllers
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _globalKey,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 90),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //logo widget
                        ImageWidget(
                          height: 140,
                          width: 200,
                        ),
                        // text field
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0, bottom: 15),
                          child: Text(
                            'Welcome to Faithbreed',
                            style: Styles.gtextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 30.0, bottom: 20),
                    child: Column(
                      // shrinkWrap: true,
                      children: [
                        InputField(
                          obscureText: false,
                          // hintText: 'kamushken@gmail.com',
                          label: 'E-mail',
                          suffixIcon: '',
                          inputType: TextInputType.emailAddress,
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty ||
                                value == null ||
                                !value.contains('@') ||
                                !value.contains('.')) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        // password input field
                        InputField(
                          iconOnPressed: togglePasswordVisibility,
                          inputType: TextInputType.visiblePassword,
                          controller: password,
                          suffixIcon: _isHidden == true ? 'Show' : 'Hide',
                          obscureText: _isHidden,
                          label: 'Password',
                          validator: (value) {
                            // validation of user input
                            if (value!.isEmpty || value == null) {
                              return '';
                            } else if ((value.length <= 5)) {
                              return '';
                            } else if ((value.length >= 10)) {
                              return '';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  //login button
                  Padding(
                    padding: const EdgeInsets.only(
                      // top: 20.0,
                      bottom: 10.0,
                      left: 28.0,
                      right: 28.0,
                    ),
                    child: LoginButton(
                      mainText: 'Login',
                      onTap: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        // validates form details submitted by users
                        _globalKey.currentState!.validate();

                        //saves form details submitted by users
                        _globalKey.currentState!.save();
                        if (email.text.isEmpty || password.text.isEmpty) {
                          setState(() {
                            showSpinner = false;
                          });
                        } else {
                          setState(() {
                            showSpinner = true;
                          });
                        }

                        context
                            .read<AuthenticationService>()
                            .signIn(
                              email: "${email.text}",
                              password: '${password.text}',
                            )
                            .then((String value) {
                          if (value ==
                              AuthenticationState.SignedIn.toString()) {
                            Navigator.pushReplacementNamed(context, 'homepage');
                            setState(() {
                              showSpinner = false;
                            });
                          } else if (value ==
                              AuthenticationState.WrongPassword.toString()) {
                            setState(() {
                              showSpinner = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Password Incorrect!")));
                          } else {
                            setState(() {
                              showSpinner = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Something went wrong. Please, try again!")));
                            print(value);
                          }
                        });
                      },
                    ),
                  ),
                                  // forgot password button
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: 20.0,
                //     left: 8.0,
                //     bottom: 8.0,
                //     right: 8.0,
                //   ),
                //   child: TextButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, 'forgot_password');
                //     },
                //     child: Text(
                //       'Forget Password?',
                //       style: TextStyle(
                //         color: Colors.red[600],
                //         fontSize: 18.0,
                //       ),
                //     ),
                //   ),
                // ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottom  navbar
      // don't have an account button
      bottomNavigationBar: DontHaveAnAccount(
        mainText: 'Don\'t have an account?',
        subText: ' SignUp',
        onTap: () {
          Navigator.pop(
            context,
          );
        },
      ),
    );
  }
}
