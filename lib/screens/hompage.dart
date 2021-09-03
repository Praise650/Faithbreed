import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:faith_breed/bottom_nav_bar_list_screens.dart/SoulsWon.dart';
import 'package:faith_breed/bottom_nav_bar_list_screens.dart/my_profile.dart';
import 'package:faith_breed/bottom_nav_bar_list_screens.dart/add_new_soul.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget>screenList = [SoulsWon(),AddANewSoul(),MyProfile()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: screenList[selectedIndex],
      ),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: selectedIndex,
        style: TabStyle.textIn,
        backgroundColor: Colors.red[600],
        onTap: (index)=>setState(()=>selectedIndex = index),
        activeColor: Colors.white,
        elevation: 5.0,
        items: [
          TabItem(
          icon: Icon(Icons.home,color: Colors.white,),
          title: 'Home', 
          activeIcon:Icon(Icons.home,size: 34,color: Colors.white,),
        ),
        TabItem(
          icon: Icon(Icons.person_add_outlined,color: Colors.white,),
          title: 'Souls',
          activeIcon: Icon(Icons.person_add_outlined,size: 34,color: Colors.white,),
        ),
        TabItem(
          icon: Icon(Icons.account_circle_sharp,color: Colors.white,),
          title: 'Profile',
          activeIcon: Icon(Icons.account_circle_sharp,size: 34,color: Colors.white,),
        ),
        ],
        ),
    );
  }
}
