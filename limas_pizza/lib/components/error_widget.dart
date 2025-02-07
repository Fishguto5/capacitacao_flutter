import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ErrorWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  const ErrorWidget({super.key, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight*40/932,
      width: screenWidth*262/430,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 221, 72, 61),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(child:Text("As senhas não coincidem", 
        style: GoogleFonts.inter(
            fontSize: screenWidth*20/430,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(244, 249, 255, 1)
      ),),) 
      

    );
  }
}