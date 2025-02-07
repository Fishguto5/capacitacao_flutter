import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerProduct extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final String  tastePizza;
  final String description;
  final String size;
  const ContainerProduct({super.key, required this.screenHeight, required this.screenWidth, required this.tastePizza, required this.description, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight*120/932,
      width: 399*screenWidth/430,
      padding: EdgeInsets.only(left: 23*screenWidth/430),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 7*screenHeight/932
            ),
            child: Container(
            height: 101*screenHeight/932,
            width: 101*screenHeight/932,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color.fromRGBO(217, 217, 217, 1)
              )
            ),
            child: Center(
              child: Image.asset("images/pizza.png", height: 101*screenHeight/932, width: 101*screenHeight/932,),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(
              left: 118*screenWidth/430, top: 7*screenHeight/932),
              child: Text(tastePizza,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 18*screenHeight/932
              ) ,),
              ),
          Padding(
            padding: EdgeInsets.only(
              left: 118 * screenWidth / 430,
              top: 30.5 * screenHeight / 932,
            ),
            child: Container(
              width: 266 * screenWidth / 430,
              child: Text(
                "Ingredientes: $description",
                overflow: TextOverflow.ellipsis,  
                maxLines: 2,                      
                style: GoogleFonts.inter(
                  fontSize: 14*screenHeight/932,
                  fontWeight: FontWeight.w400                   
                ),
              ),
            ),
          ),
            Padding(
            padding: EdgeInsets.only(
              left: 118*screenWidth/430, top: 76.5*screenHeight/932),
              child: Text("Tamanho: $size",
                style: GoogleFonts.inter(
                  fontSize: 14*screenHeight/932,
                  fontWeight: FontWeight.w400                   
                ),),
              ),
            Positioned(
                right:0, 
                top: 72.32*screenHeight/932,
                child: GestureDetector(
                  onTap: (){
                    print("Icon carrinho de compra acionado");
                  },
                  child: 
                Icon(
                  Icons.add_shopping_cart_outlined,
                  color: const Color.fromRGBO(205, 33, 42, 1),
                  size: 26.36*screenHeight/932,
                      ),
                )),
        ],
      ),
    );
  }
}