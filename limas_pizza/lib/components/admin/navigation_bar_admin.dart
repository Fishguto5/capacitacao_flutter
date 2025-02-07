import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBarAdmin extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  const NavigationBarAdmin({super.key, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    double heightBar = screenHeight*98/932;
    double widthBar = screenWidth/5;
    return Container(
      height: heightBar,
      width: screenWidth,
        child: Row(
          children: [
            Container( //box 1
              height: heightBar,
              width: widthBar,
              color: const Color.fromRGBO(205, 33, 42, 1),
              child: Center(
                child: Icon(
                  Icons.menu_book_rounded,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  size: screenHeight*40/932,
                ),
              ),
            ),
            Container( //box 2
              height: heightBar,
              width: widthBar,
              color: const Color.fromRGBO(205, 33, 42, 1),
              child:  Center(
                child: Icon(
                  Icons.spatial_tracking_outlined,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  size: screenHeight*40/932,
                ),
              ),
            ),
            Container( //box 3
              height: heightBar,
              width: widthBar,
              color: const Color.fromRGBO(205, 33, 42, 1),
              child: Stack(
                children: [
                  Center(
                child: Icon(
                  Icons.shopping_cart_sharp,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  size: screenHeight*40/932,
                ),),
                Positioned(
                  top: 68*screenHeight/932,
                  left: 35.5*screenWidth/430,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    radius: 7.5*screenHeight/932,
                    child:  Center(
                      child: Text('0',
                      style: GoogleFonts.inter(
                        color: const Color.fromRGBO(205, 33, 42, 1),
                        fontSize: 12*screenHeight/932,
                        fontWeight: FontWeight.w400

                      ),),
                    ),
                  ) )
                ],
              ) 
              
            ),
            Container( //box 4
              height: heightBar,
              width: widthBar,
              color: const Color.fromRGBO(205, 33, 42, 1),
              child: Center(
                child: Icon(
                  Icons.menu_book_rounded,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  size: screenHeight*40/932,
                ),
              ),
            ),
            Container( //box 5
              height: heightBar,
              width: widthBar,
              color: const Color.fromRGBO(205, 33, 42, 1),
              child: Center(
                child: Icon(
                  Icons.menu_book_rounded,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  size: screenHeight*40/932,
                ),
              ),
            )
          ],
        ),
    );
  }
}