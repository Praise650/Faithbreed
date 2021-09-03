import 'package:faith_breed/DB/db.dart';
import 'package:faith_breed/newSoulsWonDialog_sheel.dart';
import 'package:faith_breed/shared_widget/reusable_list_tile.dart';
import 'package:faith_breed/shared_widget/signup_button.dart';
import 'package:faith_breed/shared_widget/text_field.dart';
import 'package:flutter/material.dart';

class AddANewSoul extends StatefulWidget {
  const AddANewSoul({Key? key}) : super(key: key);

  @override
  _AddANewSoulState createState() => _AddANewSoulState();
}

class _AddANewSoulState extends State<AddANewSoul> {
  DataBase _dataBase = DataBase();
  List<String> names = ['Afuwape', 'Praise', 'Ayo', 'Tope Aderibigbe', 'Shola'];
  List<String> email = [
    'a@gmail.com',
    'praise@yahoo.com',
    'ayo@hotmail.com',
    'tope.aderibigbe@gmail.com',
    'a.shola@yahoo.com'
  ];
  List<String> location = [
    'Futa Southgate',
    'Plot A, Okemeji Akure',
    'Stamford Bridge FUTA Southgate',
    'F&S hostel Southgate',
    'Green Garage'
  ];
  List<String> phone = [
    '08111243576',
    '09015243353',
    '07053532535',
    '0912853533',
    '081853533233'
  ];
  TextEditingController? fullName,emailaddress,address,phoneNumber,occupation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'New Soul',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red[600],
            fontSize: 30.0,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                InputField(
                  obscureText: false,
                  // hintText: 'Ayomide',
                  label: 'Full Name',
                  suffixIcon: '',
                  inputType: TextInputType.emailAddress,
                  controller: fullName,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return '';
                    }
                    return null;
                  },
                ),
                InputField(
                  obscureText: false,
                  // hintText: 'kamushken@gmail.com',
                  label: 'E-mail',
                  inputType: TextInputType.emailAddress,
                  controller: emailaddress,
                  suffixIcon: '',
                  validator: (value) {
                    if (value!.isEmpty ||
                        value == null ||
                        !value.contains('@') ||
                        !value.contains('.')) {
                      return '';
                    }
                    return null;
                  },
                ),
                InputField(
                  obscureText: false,
                  // hintText: 'Occupation',
                  label: 'Address',
                  suffixIcon: '',
                  inputType: TextInputType.emailAddress,
                  controller: address,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return '';
                    }
                    return null;
                  },
                ),
                InputField(
                  obscureText: false,
                  suffixIcon: '',
                  // hintText: 'DOB',
                  label: 'Phone Number',
                  inputType: TextInputType.emailAddress,
                  controller: phoneNumber,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return '';
                    }
                    return null;
                  },
                ),
                InputField(
                  obscureText: false,
                  // hintText: 'Occupation',
                  suffixIcon: '',
                  label: 'Occupation',
                  inputType: TextInputType.emailAddress,
                  controller: occupation,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return '';
                    }
                    return null;
                  },
                ),
                LoginButton(
                  onTap: () {
                    _dataBase.storeSoulDetails(
                      fullName.toString(), 
                      emailaddress.toString(), 
                      address.toString(), 
                      phoneNumber.toString(), 
                      occupation.toString(),
                      context,
                      );
                  },
                  mainText: 'Add Brethren',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// floatingActionButton: FloatingActionButton(
      //   tooltip: 'New soul',
      //   onPressed: () {
      //     // addNewDialog(context);
      //   },
      //   backgroundColor: Colors.white,
      //   child: Icon(
      //     Icons.person_add_alt_rounded,
      //     color: Colors.red[600],
      //   ),
      // ),


      //     EmailTextFormField(
                //   hintText: '*************',
                //   obscureText: _isHidden,
                //   labelText: 'Password',
                //   inputType: TextInputType.visiblePassword,
                //   suffixIcon: _isHidden == true ?  'Hide':'Show',
                //   iconOnPressed: togglePasswordVisibility,
                //   controller: passController,
                //   validator: (value) {
                //     pass = value;
                //     if (value!.isEmpty || value == null) {
                //       return '*Password is Required';
                //     } else if ((value.length <= 2)) {
                //       return '*Password should be atleast 3 characters';
                //     } else if ((value.length >= 10)) {
                //       return '*Password should not be more than 9 characters long';
                //     }
                //     return null;
                //   },
                // ),

                //   InputField(lines: 1,
                //     // suffixIcon: Icons.person,
                //     // hintText: 'Fagbamila',
                //     // obscureText: false,
                //     label: 'Last name',
                //     inputType: TextInputType.emailAddress,
                //     controller: emailController,
                //      validator: (value) {
                //   if (value!.isEmpty || value == null) {
                //     return '*Enter your last name';
                //   }
                //   return null;
                // },
                //   ),

                // EmailTextFormField(
                //   hintText: '*************',
                //   obscureText: _isHidden,
                //   labelText: 'Confirm Password',
                //   inputType: TextInputType.visiblePassword,
                //   suffixIcon: _isHidden == true ?  Icons.visibility_off
                //               : Icons.remove_red_eye,
                //   iconOnPressed: togglePasswordVisibility,
                //   controller: passController,
                //   validator: (value) {
                //     if (value!.isEmpty || value == null) {
                //       return '*Field cannot be empty';
                //     }else if(value != pass){
                //       return 'Should be the same with password';
                //      }else if ((value.length <= 2)) {
                //       return '*Password should be atleast 3 characters';
                //     } else if ((value.length >= 10)) {
                //       return '*Password should not be more than 9 characters long';
                //     }
                //     return null;
                //   },
                // ),