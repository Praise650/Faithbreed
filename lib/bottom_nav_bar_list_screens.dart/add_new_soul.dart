import 'package:faith_breed/DB/db.dart';
import 'package:faith_breed/shared_widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddANewSoul extends StatefulWidget {
  const AddANewSoul({Key? key}) : super(key: key);

  @override
  _AddANewSoulState createState() => _AddANewSoulState();
}

class _AddANewSoulState extends State<AddANewSoul> {
  DataBase _dataBase = DataBase();
  TextEditingController fullName = TextEditingController();
  TextEditingController emailaddress = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController occupation = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 35),
            padding: EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'New Soul',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red[600],
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: InputField(
                              obscureText: false,
                              // hintText: 'Ayomide',
                              label: 'Full Name',
                              suffixIcon: '',
                              inputType: TextInputType.name,
                              controller: fullName,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InputField(
                              obscureText: false,
                              // hintText: 'kamushken@gmail.com',
                              label: 'E-mail',
                              inputType: TextInputType.emailAddress,
                              controller: emailaddress,
                              suffixIcon: '',
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InputField(
                              obscureText: false,
                              // hintText: 'Occupation',
                              label: 'Address',
                              suffixIcon: '',
                              inputType: TextInputType.streetAddress,
                              controller: address,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InputField(
                              obscureText: false,
                              suffixIcon: '',
                              // hintText: 'DOB',
                              label: 'Phone Number',
                              inputType: TextInputType.phone,
                              controller: phoneNumber,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InputField(
                              obscureText: false,
                              // hintText: 'Occupation',
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: GestureDetector(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Add Brethren'.toUpperCase(),
                                    style: GoogleFonts.openSans(
                                      color: Color(0xFFD12424),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (fullName.text.isEmpty ||
                                    emailaddress.text.isEmpty ||
                                    occupation.text.isEmpty ||
                                    occupation.text.isEmpty ||
                                    address.text.isEmpty) {
                                  setState(() {
                                    showSpinner = false;
                                  });
                                } else {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                }
                                if (
                                    // validates form details submitted by users
                                    _globalKey.currentState!.validate()) {
                                  // saves form details submitted by users
                                  _globalKey.currentState!.save();
                                } else {
                                  // if field are empty return null (do not proceed)
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  return null;
                                }
                                Future.delayed(Duration(seconds: 5));
                                _dataBase
                                    .storeSoulDetails(
                                      fullName.text,
                                      emailaddress.text,
                                      address.text,
                                      phoneNumber.text,
                                      occupation.text,
                                    )
                                    .then(
                                      (value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          padding: EdgeInsets.only(
                                              bottom: 30.0, left: 20.0),
                                          content:
                                              Text("Details added succesfully"),
                                        ),
                                      ),
                                    );
                                fullName.clear();
                                emailaddress.clear();
                                address.clear();
                                phoneNumber.clear();
                                occupation.clear();
                                setState(() {
                                  showSpinner = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
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

// floatingActionButton: FloatingActionButton(
//   tooltip: 'New soul',
//   onPressed: () {
//     // addNewDialog(context);
//   },
//   backgroundColor: Colors.white,
//   child: Icon(
//     Icons.person_add_alt_rounded,
//     color: Colors.red[600],
//   ),
// ),

// LoginButton(
//   onTap: () {
//     if (
//         // validates form details submitted by users
//         _globalKey.currentState!.validate()) {
//       // saves form details submitted by users
//       _globalKey.currentState!.save();
//     } else {
//       // if field are empty return null (do not proceed)
//       return null;
//     }
//     _dataBase
//         .storeSoulDetails(
//           fullName.text,
//           emailaddress.text,
//           address.text,
//           phoneNumber.text,
//           occupation.text,
//         )
//         .then((value) =>
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 padding:
//                     EdgeInsets.only(bottom: 30.0, left: 20.0),
//                 content: Text("Details added succesfully"),
//               ),
//             ));
//     fullName.clear();
//     emailaddress.clear();
//     address.clear();
//     phoneNumber.clear();
//     occupation.clear();
//   },
//   mainText: 'Add Brethren',
// ),
