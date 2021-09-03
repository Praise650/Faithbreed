import 'package:faith_breed/DB/authentications.dart';
import 'package:faith_breed/DB/db.dart';
import 'package:faith_breed/shared_widget/dont_have_an_account.dart';
import 'package:faith_breed/shared_widget/image_asset.dart';
import 'package:faith_breed/shared_widget/signup_button.dart';
import 'package:faith_breed/shared_widget/text_field.dart';
import 'package:faith_breed/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isHidden = true;
  FirebaseAuth firebase = FirebaseAuth.instance;
  void togglePasswordVisibility() => setState(() => _isHidden = !_isHidden);
  // form key for validation
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  //text controllers
  TextEditingController? password, email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo widget
            ImageWidget(
              height: 200,
              width: 200,
            ),
            // text field
            Text(
              'Welcome to Faithbreed',
              style: Styles.gtextStyle,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 20.0,
              ),
              // form input field
              child: Form(
                key: _globalKey,
                child: ListView(
                  shrinkWrap: true,
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
                        } else if ((value.length <= 2)) {
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
            ),
            //login button
            Padding(
              padding: const EdgeInsets.only(
                top: 25.0,
                bottom: 0.0,
                left: 28.0,
                right: 28.0,
              ),
              child: LoginButton(
                  mainText: 'Login',
                  onTap: () async{
                    // validates form details submitted by users
                    _globalKey.currentState!.validate();
                      //saves form details submitted by users
                      _globalKey.currentState!.save();
                      // Navigate to next page
                      
                        context
                            .read<AuthenticationService>()
                            .signIn(
                              email: "ayokanmi12752gmail.com",
                              password: 'password.toString()',
                            )
                            .then((value) =>
                                Navigator.pushNamed(context, 'hshs'));
                    // AuthenticationService authenticationService = AuthenticationService(firebase);
                    //     await authenticationService.signUp(
                    //       email: email.toString(), 
                    //       password: password.toString())
                    //       .then((value) =>  Navigator.pushNamed(context, 'homepage'),);
                  }),
            ),
            // forgot password button
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 8.0,
                bottom: 8.0,
                right: 8.0,
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Colors.red[600],
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
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
