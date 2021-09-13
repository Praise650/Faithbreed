import 'package:faith_breed/DB/authentications.dart';
import 'package:faith_breed/DB/db.dart';
import 'package:faith_breed/shared_widget/dont_have_an_account.dart';
import 'package:faith_breed/shared_widget/image_asset.dart';
import 'package:faith_breed/shared_widget/signup_button.dart';
import 'package:faith_breed/shared_widget/text_field.dart';
import 'package:faith_breed/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //text controllers
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  //creating an instace of database
  DataBase _dataBase = DataBase();
  FirebaseAuth firebase = FirebaseAuth.instance;
  // bool for visibility widget
  // loading spinner
  bool showspinner = false;
  // form key for validation
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isHidden = true;
  // method handling obscure text in textFormField
  void togglePasswordVisibility() => setState(() => _isHidden = !_isHidden);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // the widget that houses the LOGO
                  ImageWidget(
                    height: 140,
                    width: 200,
                  ),
                  //display the become an Ambassador text
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Become An Ambassador',
                      style: Styles.textStyle,
                    ),
                  ),
                  Container(
                    child: Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                          top: 20.0,
                        ),
                        child: ListView(
                          children: [
                            InputField(
                              obscureText: false,
                              // hintText: 'Ayomide',
                              label: 'Full Name',
                              inputType: TextInputType.emailAddress,
                              controller: fullName,
                              suffixIcon: '',
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                            InputField(
                              // hintText: 'kamushken@gmail.com',
                              obscureText: false,
                              suffixIcon: '',
                              label: 'E-mail',
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
                            InputField(
                              obscureText: _isHidden,
                              // hintText: 'kamushken@gmail.com',
                              label: 'Password',
                              iconOnPressed: togglePasswordVisibility,
                              inputType: TextInputType.visiblePassword,
                              controller: password,
                              suffixIcon: _isHidden == true ? 'Show' : 'Hide',
                              validator: (value) {
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
                            InputField(
                              // hintText: 'Occupation',
                              obscureText: false,
                              suffixIcon: '',
                              label: 'Occupation',
                              inputType: TextInputType.name,
                              controller: occupation,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                            InputField(
                              obscureText: false,
                              suffixIcon: '',
                              label: 'DOB',
                              hintText: 'DD/MM',
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                                // ignore: deprecated_member_use
                                WhitelistingTextInputFormatter.digitsOnly,
                                MaskedInputFormatter("00/00",),
                              ],
                              inputType: TextInputType.datetime,
                              controller: dateOfBirth,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 0.0, bottom: 10),
                    child: LoginButton(
                        mainText: 'Register',
                        onTap: () async {
                          setState(() {
                              showspinner = true;
                            });
                          // validates form details submitted by users
                          if (_globalKey.currentState!.validate()) {
                            // saves form details submitted by users
                            _globalKey.currentState!.save();
                          }
                          if (fullName.text.isEmpty ||
                              email.text.isEmpty ||
                              password.text.isEmpty ||
                              occupation.text.isEmpty ||
                              dateOfBirth.text.isEmpty) {
                            setState(() {
                              showspinner = false;
                            });
                          }else{
                            setState(() {
                              showspinner = true;
                            });
                          }
                          // create and authenticate the user
                          print('authenticating');
                          AuthenticationService authenticationService =
                              context.read<AuthenticationService>();
                          await authenticationService
                              .signUp(
                                  email: '${email.text}',
                                  password: "${password.text}")
                              .then(
                            (String value) async {
                              if (value ==
                                  AuthenticationState.UserCreated.toString()) {
                                // store details supplied by user to to cloud fireStore
                                await _dataBase.storeUsersDetails(
                                  fullName.text,
                                  email.text,
                                  // password.text,
                                  occupation.text,
                                  dateOfBirth.text,
                                );
                                Navigator.pushNamed(context, 'homepage');
                                setState(() {
                                  showspinner = false;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Something went wrong. Please, try again!")));
                              }
                            },
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: DontHaveAnAccount(
        mainText: 'Already a member?',
        subText: ' SignIn',
        onTap: () {
          Navigator.pushNamed(context, 'sign_in');
        },
      ),
    );
  }
}
