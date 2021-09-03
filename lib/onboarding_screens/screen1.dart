import 'package:faith_breed/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

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
            // SvgPicture.asset('images/around_the_world-rafiki.png',width: 400,height: 330,),
            Image(image: AssetImage('images/around_the_world-rafiki.png'),width: 400,height: 330,),
            SizedBox(
              height: 20,
            ),
            Text(
              'Kingdom Ambassadors',
              style: Styles.gtextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Therefore, go and make disciples'+'\n'
              'of all the nations, baptizing them'+'\n'
              'in the name of the Father, and the'+'\n'
              'Son, and the Holy Spirit.',
              textAlign: TextAlign.center,
              style: Styles.gbodyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
