import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animationController!.forward(from: 0);

    animationController!.addListener(() {
      setState(() {});
    });

    animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // final firebaseuser = context.watch<User>();
        // if (firebaseuser != null) {
          // Navigator.pushReplacementNamed(context, 'homepage');
        // } else if (firebaseuser == null) {
          Navigator.pushReplacementNamed(context, 'on_boarding');
        // } else {
          // Navigator.pushReplacementNamed(context, 'on_boarding');
        // }
      }
    });
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // AnimatedOpacity(
          //   opacity: _visible?1.0:0.0,
          //   duration: Duration(microseconds: 500),
          //   child: ,
          // ),
          Container(
            color: Color(0xFFf1a1a1),
            // scale: 1.0,
            width: MediaQuery.of(context).size.width,
            // fit: BoxFit.cover,
          ),
          Center(
            child: Opacity(
              opacity: animationController!.value,
              child: Image.asset("images/logotrans.png"),
            ),
          )
        ],
      ),
    );
  }
}
