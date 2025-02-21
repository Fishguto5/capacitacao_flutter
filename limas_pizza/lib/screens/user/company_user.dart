import 'package:flutter/material.dart';
import 'package:limas_pizza/components/admin/navigation_bar_admin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:limas_pizza/components/employee/model_employee.dart';
import 'package:limas_pizza/screens/user/own_page.dart';
import 'package:limas_pizza/firebase/user/get_data.dart';

class CompanyUser extends StatefulWidget {
  const CompanyUser({super.key});

  @override
  State<CompanyUser> createState() => _CompanyUserState();
}

class _CompanyUserState extends State<CompanyUser> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: NavigationBarAdmin(screenHeight: screenHeight, screenWidth: screenWidth),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15, left: 15),
            child: Row(
              children: [
                Text("Usuários",
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w600
              ),),
            SizedBox(
              width: 160*screenWidth/430,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const OwnPage()));
              },
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.green,
              ),
            )
              ],
              ),),
              SizedBox(
                height: 40*screenHeight/932,
              ),
              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Erro ao carregar dados'));
                    } else {
                      List<Map<String, dynamic>> users = snapshot.data ?? [];
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3),
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return ModelEmployee(
                              name: users[index]['name'] ?? 'Sem nome',
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                            );
                          },
                      );
                    }
                  },
                ) ,
                )
          ],
        )),
      
    );
  }
}