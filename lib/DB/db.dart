import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? firebase = FirebaseAuth.instance.currentUser;
// stores signin details of users
  Future<void> storeUsersDetails(String fullname, String email, 
  // String password,
      String occupation, String dateOfbirth) async {
    final CollectionReference<Map<String, dynamic>> users =
        firestore.collection("SignedInUsersDetails");

    DateTime dateCreated = DateTime.now();

    return users
        .add({
          'FullName': fullname,
          'E-mail': email,
          // 'PassWord':password, // You shouldn't add a user's password to your db
          'Occupation': occupation,
          'DOB': dateOfbirth,
          'timestamp': dateCreated
              .toString(), // You need this to track things on your db
          'createdAt': dateCreated.millisecondsSinceEpoch,
        })
        .then((value) => print('Details Added'))
        .catchError((onError) => print('$onError'));
  }

// method handling new saved souls
  Future<void> storeSoulDetails(String fullname, String email, String address,
      String phoneNumber, String occupation,) async {
        DateTime dateCreated = DateTime.now();
    final DocumentReference<Map<String, dynamic>> users = firestore
        .collection("SavedSoulDetails").doc(firebase!.email).collection('EachSavedSoulDetails').doc(email);
    return users
        .set({
          'FullName': fullname,
          'E-mail': email,
          'Address': address,
          'PhoneNumber': phoneNumber,
          'Occupation': occupation,
          'timestamp': dateCreated
              .toString(), // You need this to track things on your db
          'createdAt': dateCreated.millisecondsSinceEpoch,
        })
        .then((value) => print('Details Added'))
        .catchError((onError) => print('$onError'));
  }

  Future<void> updateStoreUserDetails(
    String fullname, 
      String occupation, String dateOfbirth){
        final DocumentReference<Map<String, dynamic>> users = firestore.collection("SignedInUsersDetails").doc(firebase!.uid);
        DateTime dateCreated = DateTime.now();

    return users
        .update({
          'FullName': fullname,
          'Occupation': occupation,
          'DOB': dateOfbirth,
          'timestamp': dateCreated
              .toString(), // You need this to track things on your db
          'createdAt': dateCreated.millisecondsSinceEpoch,
        })
        .then((value) => print('Details Added'))
        .catchError((onError) => print('$onError'));

  }
}


// Future<void> storeDetails(String fullname, String email, String password,
//       String occupation, String dateOfbirth) async {
//     final CollectionReference users =
//         firestore.doc(firebase!.email.toString()).collection("SignedInUsersDetails");

//     DateTime dateCreated = DateTime.now();

//     return users
//         .add({
//           'FullName': fullname,
//           'E-mail': email,
//           // 'PassWord':password, // You shouldn't add a user's password to your db
//           'Occupation': occupation,
//           'DOB': dateOfbirth,
//           'timestamp': dateCreated
//               .toString(), // You need this to track things on your db
//           'createdAt': dateCreated.millisecondsSinceEpoch,
//         })
//         .then((value) => print('Details Added'))
//         .catchError((onError) => print('$onError'));
//   }




// Future<void> storeSoulDetails(String fullname, String email, String address,
//       String phoneNumber, String occupation,) async {
//     final DocumentReference<Map<String, dynamic>> users = firestore
//         .collection("SavedSoulDetails").doc(firebase!.email.toString());
//     return users
//         .set({
//           'FullName': fullname,
//           'E-mail': email,
//           'Address': address,
//           'PhoneNumber': phoneNumber,
//           'Occupation': occupation,
//         })
//         .then((value) => print('Details Added'))
//         .catchError((onError) => print('$onError'));
//   }