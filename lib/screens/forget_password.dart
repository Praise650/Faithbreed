import 'package:faith_breed/shared_widget/signup_button.dart';
import 'package:faith_breed/shared_widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isHidden = true;
  FirebaseAuth firebase = FirebaseAuth.instance;
  void togglePasswordVisibility() => setState(() => _isHidden = !_isHidden);
  // form key for user input validation
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  //text controller
  TextEditingController updatePassword = TextEditingController();
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
            // //logo widget
            // ImageWidget(
            //   height: 140,
            //   width: 200,
            // ),
            // // text field
            // Padding(
            //   padding: const EdgeInsets.only(top:20.0),
            //   child: Text(
            //     'Welcome to Faithbreed',
            //     style: Styles.gtextStyle,
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 20.0,
              ),
              // form input field
              child: Form(
                key: _globalKey,
                child: InputField(
                  iconOnPressed: togglePasswordVisibility,
                  inputType: TextInputType.visiblePassword,
                  controller: updatePassword,
                  suffixIcon: _isHidden == true ? 'Show' : 'Hide',
                  obscureText: _isHidden,
                  label: 'New Password',
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
                  mainText: 'Update'.toUpperCase(),
                  onTap: () async {
                    if (
                        // validates form details submitted by users
                        _globalKey.currentState!.validate()) {
                      // saves form details submitted by users
                      _globalKey.currentState!.save();
                    } else {
                      // if field are empty return null (do not proceed)
                      return null;
                    }
                    await FirebaseAuth.instance.currentUser!
                        .updatePassword(updatePassword.text)
                        .then((value) =>
                            Navigator.pushReplacementNamed(context, 'sign_in'));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      padding: EdgeInsets.only(bottom: 30.0, left: 20.0),
                      content: Text("Password has been changed succesfully"),
                    ));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
