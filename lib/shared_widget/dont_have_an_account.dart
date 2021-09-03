import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccount extends StatelessWidget {
  DontHaveAnAccount({
    Key? key,
    required this.mainText,
    required this.subText,
    required this.onTap,
  }) : super(key: key);
  final String mainText;
  final String subText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: BottomAppBar(
        elevation: 0.0,
        child: Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: onTap,
            child: RichText(
              text: TextSpan(
                text: mainText,
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    // recognizer: TapGestureRecognizer()..onTap= onTap,
                    text: subText,
                    style: TextStyle(
                      color: Colors.red[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}