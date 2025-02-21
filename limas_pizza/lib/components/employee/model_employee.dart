import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ModelEmployee extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final String name;
  const ModelEmployee({super.key, required this.screenHeight, required this.screenWidth, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54*screenHeight/932,
        width: 352*screenWidth/430,
        child: Padding(
          padding: EdgeInsets.only(left: 23*screenWidth/430),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.person,
              size: 50),
              SizedBox(
                width: 32*screenWidth/430,
              ),
              Text(name,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500
              )),
              SizedBox(width: 80*screenWidth/430,),
              GestureDetector(
                onTap: (){
                  print("Edit bottom is working");
                },
                child: const Icon(
                  Icons.edit,
                  size: 34,
                ),
              ),
              SizedBox(width:32*screenWidth/430,),
              GestureDetector(
                onTap: () {
                  print("Delete bottom is working");
                },
                child: const Icon(Icons.delete,
                size: 34,),
              )
            ],
          ),

        )
    );
      }
    }