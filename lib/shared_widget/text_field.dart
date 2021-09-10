import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? label;
  final int lines;
  final TextInputType? inputType;
  TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  VoidCallback? iconOnPressed;
  final String? suffixIcon;
  InputField({
    Key? key,
    this.iconOnPressed,
    this.suffixIcon,
    this.label,
    this.lines = 1,
    this.inputType,
    this.validator,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction, validator: validator,
        obscureText: obscureText,
        controller: controller,
        minLines: lines,
        maxLines: lines,
        keyboardType: inputType,
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            height: 0,
          ),
          suffixIcon: TextButton(
            onPressed: iconOnPressed,
            child: Text(suffixIcon.toString()),
          ),
          labelText: "$label",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onSaved: (String? value){
          String control = controller.toString();
          control=value.toString();
          print('$control'+ ' value of reuseable textfield');
        },
      ),
    );
  }
}
