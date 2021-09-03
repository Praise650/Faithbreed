import 'package:faith_breed/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BecomeAnAmbassador extends StatelessWidget {
  const BecomeAnAmbassador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Image(image: AssetImage('images/logotrans.png'))),
            SizedBox(
              height: 61,
            ),
            Text(
              'Welcome to Faithbreed',
              textAlign: TextAlign.center,
              style: Styles.gtextStyle,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'We are kingdom Ambassadors\nsaddled with responsibility of\nspreading the gospel',
              textAlign: TextAlign.center,
              style: Styles.gbodyTextStyle,
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      width: 2, color: Colors.red, style: BorderStyle.solid),
                ),
                child: Center(
                  child: Text(
                    'become an ambassador'.toUpperCase(),
                    style: GoogleFonts.openSans(
                      color: Color(0xFFD12424),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'register_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
