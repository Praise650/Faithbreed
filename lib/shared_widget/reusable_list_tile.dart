import 'package:faith_breed/model.dart';
import 'package:flutter/material.dart';

import '../newSoulsWonDialog_sheel.dart';

class ReusableListTile extends StatelessWidget {
  ReusableListTile({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          enableFeedback: true,
          onTap: onPressed,
          leading: Text(
            '$text',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
        Divider(
          indent: 15.0,
          endIndent: 20.0,
          height: 0,
          thickness: 1.0,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class ReusableListTileForList extends StatelessWidget {
  ReusableListTileForList(
    this.souls, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  VoidCallback onPressed;
  RegisteredSouls souls;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          // () {
          // showss(
          //   context,
          //   souls.nameController!.text,
          //   souls.emailController!.text,
          //   souls.phoneController!.text,
          //   souls.locationController!.text,
          // );
          // },
          leading: Text(
            '${souls.nameController.toString()}',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
      ],
    );
  }
}
