import 'package:faith_breed/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: Image(image: AssetImage('images/Internet_on_the_go_rafiki.png'),width: 400,height: 300,),),
            SizedBox(
              height: 20,
            ),
            Text(
              'Evangelism on the go',
              style: Styles.gtextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Access all tools needed to reach out \nto more souls.',
              textAlign: TextAlign.center,
              style: Styles.gbodyTextStyle,
            ),
            SizedBox(
              height: 30,
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
                    'Get Started'.toUpperCase(),
                    style: GoogleFonts.openSans(
                      color: Color(0xFFD12424),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'become_an_ambassador');
              },
            ),
          ],
        ),
      ),
    );
  }
}
