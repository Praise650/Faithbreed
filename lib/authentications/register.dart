import 'package:faith_breed/DB/authentications.dart';
import 'package:faith_breed/DB/db.dart';
import 'package:faith_breed/shared_widget/dont_have_an_account.dart';
import 'package:faith_breed/shared_widget/image_asset.dart';
import 'package:faith_breed/shared_widget/signup_button.dart';
import 'package:faith_breed/shared_widget/text_field.dart';
import 'package:faith_breed/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //text controllers
  TextEditingController? fullName, email, password, occupation, dateOfbirth;
  //creating an instace of database
  DataBase _dataBase = DataBase();
  FirebaseAuth firebase = FirebaseAuth.instance;
  // bool for visibility widget
  final bool? visible= false;
  // form key for validation
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool _isHidden = true;
  // method handling obscure text in textFormField
  void togglePasswordVisibility() => setState(() => _isHidden = !_isHidden);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                Text(
                  'Become An Ambassador',
                  style: Styles.textStyle,
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
                              } else if ((value.length <= 2)) {
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
                            inputType: TextInputType.emailAddress,
                            controller: occupation,
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          InputField(
                            // hintText: 'DOB',
                            obscureText: false,
                            suffixIcon: '',
                            label: 'DOB',
                            inputType: TextInputType.emailAddress,
                            controller: dateOfbirth,
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
                        // ignore: unnecessary_statements
                        visible == true;
                      });
                       print('first name'+fullName.toString(),);
                      print(email.toString(),);
                      print(password.toString(),);
                      print(occupation.toString(),);
                      print('date of birth'+dateOfbirth.toString(),);
                      // validates form details submitted by users
                      _globalKey.currentState!.validate();
                        // saves form details submitted by users
                        _globalKey.currentState!.save();
                        
                        // store details supplied by user to to cloud firestore
                        await _dataBase.storeDetails(
                          fullName.toString(),
                          email.toString(),
                          password.toString(),
                          occupation.toString(),
                          dateOfbirth.toString(),
                        );
                        // create and authenticate the user
                        print('authenticating');
                        AuthenticationService authenticationService = AuthenticationService(firebase);
                        await authenticationService.signUp(
                          email: 'email.toString()', 
                          password: "password.toString()")
                          .then((value) =>  Navigator.pushNamed(context, 'sign_in'),);
                        // await context
                        //     .read<AuthenticationService>()
                        //     .signUp(
                        //       email: email.toString(),
                        //       password: password.toString(),
                        //     )
                        //     .then(
                        //       (value) =>
                        //           Navigator.pushNamed(context, 'sign_in'),
                        //     );
                        // ignore: unnecessary_statements
                      visible == false;
                      }
                  ),
                ),
                Visibility(
                  visible: visible??true,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
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
