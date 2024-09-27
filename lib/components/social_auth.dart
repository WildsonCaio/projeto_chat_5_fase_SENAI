import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {

  List<Color> gradientColors;
  String iconSocial;
  Color iconColor;


  SocialAuth({super.key, required this.gradientColors, required this.iconSocial, required this.iconColor});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          // begin: Alignment.topCenter,
          colors: gradientColors,
        ),
      ),
      child: Image.network(
        color: iconColor,
        iconSocial,
      ),
    );
  }
}
