// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'DB/authentications.dart';

// class sbdsdfb extends StatefulWidget {
//   const sbdsdfb({Key? key}) : super(key: key);

//   @override
//   _sbdsdfbState createState() => _sbdsdfbState();
// }

// class _sbdsdfbState extends State<sbdsdfb> {

//     final FirebaseAuth _auth = FirebaseAuth.instance;
//   get user => _auth.currentUser;

//  //SIGN UP METHOD
//   Future signUp(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       // return 'null';
//     } on FirebaseAuthException catch (e) {
//       // return e.message.toString();
//     }
//   }
//   Future signIn(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
//   Future signOut() async {
//     await _auth.signOut();

//     print('signout');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           TextButton(
//             onPressed: (){
//               signUp('ayo@gmail.com', '1243');
//               },
//             child: Text('Test FireBase Create'),
//           ),
//           TextButton(
//             onPressed: (){
//               signIn('ayo@gmail.com', '1243');
//               },
//             child: Text('Test FireBase sign in'),
//           ),
//           TextButton(
//             onPressed: (){
//               signOut();
//               },
//             child: Text('Test FireBase sign out'),
//           ),
//           Text(_auth.currentUser!.email.toString()),
//         ],
//       ),
//     );
//   }
// }
