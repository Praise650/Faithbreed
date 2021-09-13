import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faith_breed/models/souls.dart';
import 'package:faith_breed/shared_widget/reusable_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../newSoulsWonDialog_sheel.dart';

class SoulsWon extends StatefulWidget {
  const SoulsWon({Key? key}) : super(key: key);

  @override
  _SoulsWonState createState() => _SoulsWonState();
}

class _SoulsWonState extends State<SoulsWon> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  initState() {
    super.initState();
    setState(() {
      // getAllDocument();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Souls Won',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red[600],
            fontSize: 30.0,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("SavedSoulDetails")
                  .doc(user!.email)
                  .collection('EachSavedSoulDetails')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshots) {
                if (snapshots.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Loading..."));
                }
                if (snapshots == null) {
                  return Text('Nothing to show');
                }
                if (snapshots.hasData ||
                    snapshots.connectionState == ConnectionState.done) {
                  final users = snapshots.data!.docs;
                  List<Widget> list = [];
                  for (var user in users) {
                    print(user.data());
                    Souls soul = Souls.fromJson(user.data());
                    soul.id = user.id;
                    final displayWidget = ReusableListTile(
                        text: soul.fullname,
                        onPressed: () {
                          show(context, soul);
                        });
                    list.add(displayWidget);
                  }
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: list,
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}

// ListView(
//           children: [],
//           // List.generate(
//   imageList.length,
//   (index) => Padding(
//     padding: const EdgeInsets.only(left:25.0,right: 25.0,top: 8.0,),
//     child: Card(
//       child: Container(
//         child: Image(
//           image: imageList[index],
//           fit: BoxFit.fill,
//            width: size.width,
//         ),
//       ),
//     ),
//   ),
// ),

// // A list of images
// List<String> names = ['Afuwape', 'Praise', 'Ayo', 'Tope Aderibigbe', 'Shola'];
// List<String> email = [
//   'a@gmail.com',
//   'praise@yahoo.com',
//   'ayo@hotmail.com',
//   'tope.aderibigbe@gmail.com',
//   'a.shola@yahoo.com'
// ];
// List<String> location = [
//   'Futa Southgate',
//   'Plot A, Okemeji Akure',
//   'Stamford Bridge FUTA Southgate',
//   'F&S hostel Southgate',
//   'Green Garage'
// ];
// List<String> phone = [
//   '08111243576',
//   '09015243353',
//   '07053532535',
//   '0912853533',
//   '081853533233'
// ];

// FirebaseFirestore.instance
//     .collection("SavedSoulDetails")
//     .get()
//     .then((querySnapshot) {
//   querySnapshot.docs.forEach((result) {
//     FirebaseFirestore.instance
//         .collection("SavedSoulDetails")
//         .doc(result.id)
//         .collection("EachSavedSoulDetails")
//         .get()
//         .then((querySnapshot) {
//       querySnapshot.docs.forEach((result) {
//         print(result.data());
//       });
//     });
//   });
// });

//    getAllDocument() async {
//   final users = await FirebaseFirestore.instance
//       .collection("SavedSoulDetails")
//       .doc(user!.email)
//       .collection('EachSavedSoulDetails')
//       .get();
//   for (var user in users.docs) {
//     print(user.data());
//     print(user.data()['FullName']);
//     print('is it :${user.data()['FullName']} you or the lifestyle');
//   }
// }
