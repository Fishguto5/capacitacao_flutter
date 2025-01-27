import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container( //Green curve in the top of the screen
              width: screenWidth,
              height: 70*screenHeight/932,
              child: Image.asset("images/green_curve.png",
              // fit: BoxFit.fill,
              ),
            ),),
          Positioned( //Green points in the top of the screen
            top: 44*screenHeight/932,
            right: 0*screenWidth/430,
            child:Image.asset("images/green_points.png",height: 100*screenHeight/932,)),
          Positioned( // Complement bar of the Logo
            top: 152*screenHeight/932,
            left: 118*screenWidth/430,
            child:Image.asset("images/complement_logo.png",height: 6*screenHeight/932,width: 194*screenWidth/430,)),
          Positioned( //Logo of Lima's Pizza
            bottom: 573*screenHeight/932,
            left: 74*screenWidth/430,
            child: Image.asset("images/logo_login.png", height: 240*screenHeight/932, width: 281.5*screenWidth/430,)),
         Positioned(
            bottom: 0,
            child: Container( //Red curve in the back of the screen
              width: screenWidth,
              height: 70*screenHeight/932,
              child: Image.asset("images/red_curve.png",
              // fit: BoxFit.fill,
              ),
            ),),
          Positioned( //Red points in the back of the screen
            bottom: 90*screenWidth/932,
            left: 0,
            child: Image.asset("images/red_points.png", height: 100*screenHeight/932,)),
          Positioned(
            top: 410*screenHeight/932,
            left: 153*screenWidth/430,
            child: Text("Login", style: GoogleFonts.inter(
              fontSize: 48*screenHeight/932,
              fontWeight: FontWeight.w400)))
        ],
      ),
    );
  }
}
