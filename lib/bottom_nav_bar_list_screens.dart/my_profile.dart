import 'package:faith_breed/shared_widget/reusable_list_tile.dart';
import 'package:faith_breed/styles/styles.dart';
import 'package:flutter/material.dart';

import '../newSoulsWonDialog_sheel.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/sermonImage2.png'),
              maxRadius: 80 / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0,bottom: 8.0,),
              child: Text(
                'Afuwape Praise',
                style: Styles.textStyle,
              ),
            ),
            Padding(
               padding: const EdgeInsets.only(top:0.0,bottom: 50.0,),
              child: Text(
                'email@gmail.com',
                style: Styles.bodyTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0, bottom:0.0,left: 12.0,right: 12.0,),
              child: Column(
                children: [
                  ReusableListTile(
                    text: 'Edit Profile',
                    onPressed: () {
                      //  show(context);
                    },
                  ),
                  ReusableListTile(
                    text: 'Change Password',
                    onPressed: () {
                      //  show(context);
                    },
                  ),
                  ReusableListTile(
                    text: 'Notification preferences',
                    onPressed: () {
                      //  show(context);
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
