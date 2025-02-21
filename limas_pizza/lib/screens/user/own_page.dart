import 'package:flutter/material.dart';
import 'package:limas_pizza/components/admin/navigation_bar_admin.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnPage extends StatelessWidget {
  const OwnPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: NavigationBarAdmin(screenHeight: screenHeight, screenWidth: screenWidth),
      body: Column(
        children: [
          SizedBox(
            height:40*screenHeight/932 ,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Perfil",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w600
                  ),),
              ),
              SizedBox(
                width: 229*screenWidth/430 ,
              ),
              const Icon(
                Icons.person,
                color: Colors.green,
                size:52,
              ),
              SizedBox(
                height: 43*screenHeight/932,
              ),

            ],
          )
        ],
      ),
    );
  }
}