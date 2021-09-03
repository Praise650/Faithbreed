import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static final textStyle = TextStyle(
    color: Colors.black,
    fontSize: 25.0,
    wordSpacing: 2.0,
    fontWeight: FontWeight.w600,
  );
  static final bodyTextStyle = TextStyle(
    color: Colors.black54,
    // letterSpacing: 1.0,
    fontSize: 20.0,
    wordSpacing: 2.0,
    height: 1.0,
  );
  static final gtextStyle = GoogleFonts.openSans(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    // letterSpacing: 1.0,
    fontSize: 25.0,
    // wordSpacing: 2.0,
    height: 1.0,
  );
  static final gbodyTextStyle = GoogleFonts.openSans(
    color: Colors.black54,
    // letterSpacing: 1.0,
    fontSize: 20.0,
    // wordSpacing: 2.0,
    // height: 1.0,
    // height: MediaQuery.of(context).size.height*0.6,
    fontWeight: FontWeight.w400,
  );
}
