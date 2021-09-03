import 'package:faith_breed/styles/styles.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

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
            Image(image: AssetImage('images/Adventure-pana.png'),width: 400,height: 300,),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ye are the light of the world',
              style: Styles.gtextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'In the same way, let your good deeds \nshine out for all to see, so that \neveryone will praise your heavenly \nFather.',
              textAlign: TextAlign.center,
              style: Styles.gbodyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
