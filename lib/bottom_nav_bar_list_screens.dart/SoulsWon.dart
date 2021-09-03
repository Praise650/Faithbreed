import 'package:faith_breed/shared_widget/reusable_list_tile.dart';
import 'package:flutter/material.dart';

import '../newSoulsWonDialog_sheel.dart';

class SoulsWon extends StatefulWidget {
  const SoulsWon({Key? key}) : super(key: key);

  @override
  _SoulsWonState createState() => _SoulsWonState();
}

class _SoulsWonState extends State<SoulsWon> {
  // A list of images 
  List<String> names = ['Afuwape', 'Praise', 'Ayo', 'Tope Aderibigbe', 'Shola'];
  List<String> email = ['a@gmail.com', 'praise@yahoo.com', 'ayo@hotmail.com', 'tope.aderibigbe@gmail.com', 'a.shola@yahoo.com'];
  List<String> location = ['Futa Southgate', 'Plot A, Okemeji Akure', 'Stamford Bridge FUTA Southgate', 'F&S hostel Southgate', 'Green Garage'];
  List<String> phone = ['08111243576', '09015243353', '07053532535', '0912853533', '081853533233'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return ReusableListTile(
                  text: names[index],
                  onPressed: () {
                    show(context,
                    names[index],
                    email[index],
                    phone[index],
                    location[index],
                  );
                  },
                );
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