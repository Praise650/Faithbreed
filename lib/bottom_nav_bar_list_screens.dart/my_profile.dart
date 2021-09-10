import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faith_breed/DB/authentications.dart';
import 'package:faith_breed/DB/db.dart';
import 'package:faith_breed/shared_widget/reusable_list_tile.dart';
import 'package:faith_breed/shared_widget/signup_button.dart';
import 'package:faith_breed/shared_widget/text_field.dart';
import 'package:faith_breed/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    super.initState();
    setState(() {
      getNameFromDataBase();
    });
  }

  //text controllers
  getNameFromDataBase() async {
    final userQuery = FirebaseFirestore.instance
        .collection("SignedInUsersDetails")
        .where('E-mail', isEqualTo: user!.email.toString())
        .limit(1);
    userQuery.get().then(
      (data) {
        if (data.docs.length > 0) {
          setState(() {
            name = data.docs[0].data()['FullName'];
          });
        }
      },
    );
  }

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  String? name;
  var namefdfd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 8.0,
              ),
              child: Text(
                name.toString(),
                style: Styles.textStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
                bottom: 50.0,
              ),
              child: Text(
                user!.email.toString(),
                style: Styles.bodyTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 0.0,
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                children: [
                  ReusableListTile(
                      text: 'Edit Profile',
                      onPressed: () async {
                        await updateUserDetailsDialog(context);
                        setState(() {});
                      }),
                  ReusableListTile(
                      text: 'Change Password',
                      onPressed: () {
                        updatePassword(context);
                        setState(() {});
                      }),
                  ReusableListTile(
                    text: 'Notification preferences',
                    onPressed: () => null,
                  ),
                  ReusableListTile(
                    text: 'Log Out',
                    onPressed: () {
                      showDialog(
                        useSafeArea: true,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('Are you sure you want to Log out'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel')),
                              TextButton(
                                onPressed: () {
                                  AuthenticationService service =
                                      AuthenticationService(_firebaseAuth);
                                  service.signOut().then((value) =>
                                      Navigator.pushReplacementNamed(
                                          context, 'sign_in'));
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("You have been logged out"),
                                    ),
                                  );
                                },
                                child: Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future updateUserDetailsDialog(BuildContext context) async {
  TextEditingController fullName = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  return showDialog(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Update Details',
            style: TextStyle(
                fontSize: 24,
                color: Colors.red[600],
                fontWeight: FontWeight.bold),
          ),
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1 / 2,
              width: MediaQuery.of(context).size.width * 1 / 2,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputField(
                              obscureText: false,
                              // hintText: 'Ayomide',
                              label: 'Full Name',
                              inputType: TextInputType.name,
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
                              obscureText: false,
                              // hintText: 'Ayomide',
                              label: 'Occupation',
                              inputType: TextInputType.name,
                              controller: occupation,
                              suffixIcon: '',
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                            InputField(
                              obscureText: false,
                              // hintText: 'Ayomide',
                              label: 'Date of Birth',
                              inputType: TextInputType.name,
                              controller: dateOfBirth,
                              suffixIcon: '',
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                  LoginButton(
                    mainText: 'Update'.toUpperCase(),
                    onTap: () async {
                      print(fullName.text);
                      if (
                          // validates form details submitted by users
                          _globalKey.currentState!.validate()) {
                        // saves form details submitted by users
                        _globalKey.currentState!.save();
                        DataBase dataBase = DataBase();
                      await dataBase
                          .updateStoreUserDetails(
                              fullName.text, occupation.text, dateOfBirth.text)
                          .then((value) => Navigator.pop(context));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          padding: EdgeInsets.only(bottom: 30.0, left: 20.0),
                          content: Text("Details updated succesfully"),
                        ),
                      );
                      } else {
                        // if field are empty return null (do not proceed)
                        return null;
                      }
                      fullName.clear();
                      occupation.clear();
                      dateOfBirth.clear();
                    },
                  )
                ],
              ),
            ),
          ],
        );
      });
}

updatePassword(BuildContext context) {
  TextEditingController updatePassword = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  showDialog(
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(
          'Change Password',
          style: TextStyle(
              fontSize: 24,
              color: Colors.red[600],
              fontWeight: FontWeight.bold),
        ),
        children: [
          Container(
            height: MediaQuery.of(context).size.height *0.3,
            width: MediaQuery.of(context).size.width * 1 / 2,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                InputField(
                  // iconOnPressed: togglePasswordVisibility,
                  inputType: TextInputType.visiblePassword,
                  controller: updatePassword,
                  suffixIcon: '',
                  obscureText: false,
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
                LoginButton(
                  mainText: 'Update'.toUpperCase(),
                  onTap: () async {
                    if (
                        // validates form details submitted by users
                        _globalKey.currentState!.validate()) {
                      // saves form details submitted by users
                      _globalKey.currentState!.save();
                       await FirebaseAuth.instance.currentUser!
                        .updatePassword(updatePassword.text)
                        .then((value) => Navigator.pop(context));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      padding: EdgeInsets.only(bottom: 30.0, left: 20.0),
                      content: Text("Password updated succesfully"),
                    ));
                    } else {
                      // if field are empty return null (do not proceed)
                      return null;
                    }
                  },
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}
// CircleAvatar(
//   backgroundImage: AssetImage('images/sermonImage2.png'),
//   maxRadius: 80 / 2,
// ),

 // final datas = await FirebaseFirestore.instance
    //     .collection("SignedInUsersDetails")
    //     .get();
    // for (var messages in datas.docs) {
    //   setState(() {
    //   });
    //   name = messages.data()['FullName'];
    // }
