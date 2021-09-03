import 'package:flutter/material.dart';

import 'shared_widget/signup_button.dart';

show(BuildContext context,String fullName, String email,
  String phone,
  String location,) {
  return showModalBottomSheet(
    enableDrag: true,
    elevation: 5.0,
    isDismissible: true,
    useRootNavigator: true,
    context: context,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 1 / 20,
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Details',
            style: TextStyle(
                fontSize: 24,
                color: Colors.red[600],
                fontWeight: FontWeight.bold),
          ),
          ListTile(trailing:Icon(Icons.person), title:Text(fullName),onTap: null,),
          ListTile(trailing:Icon(Icons.mail), title:Text(email),onTap: (){},),
          ListTile(trailing:Icon(Icons.phone), title:Text(phone),onTap: (){},),
          ListTile(trailing:Icon(Icons.local_activity), title:Text(location),onTap: null,),
          LoginButton(
            onTap: () {
              Navigator.pop(context);
            },
            mainText: 'Dismiss',
          ),
        ],
      ),
    ),
  );
}

// addNewDialog(BuildContext context) async {
//   return showDialog(
//     useSafeArea: true,
//     context: context,
//     builder: (context) {
//       return SimpleDialog(
//         title: Center(
//           child: Text(
//             'New Soul',
//             style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.red[600],
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height* 1 / 2,
//             width: MediaQuery.of(context).size.width * 1 / 2,
//             padding: EdgeInsets.all(10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     hintText: 'Full Name',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: phoneController,
//                   decoration: InputDecoration(
//                     hintText: 'Phone',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: locationController,
//                   decoration: InputDecoration(
//                     hintText: 'Location',
//                   ),
//                 ),
//                 LoginButton(
//                   onTap: () {},
//                   mainText: 'Add Brethren',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
