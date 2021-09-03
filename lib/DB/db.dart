import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'authentications.dart';
class DataBase{
FirebaseFirestore firestore = FirebaseFirestore.instance;
// stores signin details of users
Future<void> storeDetails(String fullname,String email,String password,String occupation, String dateOfbirth) async {
  final CollectionReference users =  firestore.collection("SignedInUsersDetails");
    return users.add({
      'FullName':  fullname,
      'E-mail': email,
      'PassWord':password,
      'Occupation': occupation,
      'DOB':dateOfbirth,
    }).then((value) => print('Details Added'))
    .catchError((onError)=>print('$onError'));
  }
// method handling new saved souls
  Future<void> storeSoulDetails(String fullname,String email,String address,String phoneNumber, String occupation,BuildContext context) async {
    // var ghgh = context.read<AuthenticationService>().getUser();
    AuthenticationService authenticationService =AuthenticationService(FirebaseAuth.instance);
    final CollectionReference users =  FirebaseFirestore.instance.doc(authenticationService.getUser().toString()).collection("SavedSoulDetails");
    return users.add({
      'FullName':  fullname,
      'E-mail': email,
      'PassWord':address,
      'PhoneNumber': phoneNumber,
      'Occupation':occupation,
    }).then((value) => print('Details Added'))
    .catchError((onError)=>print('$onError'));
  }

  // get real time data from firebase
  // Stream<QuerySnapshot> getUserData(){
  //   final CollectionReference users =  firestore.collection("SavedSoulDetails");
  //   firestore.collection('SignInUsersDetails').get().catchError(e){
  //     print(e);

  //   };
  //   return users.snapshots();
  // }
}