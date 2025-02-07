import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:limas_pizza/screens/login_page.dart';
import 'package:limas_pizza/components/error_widget.dart' as custom;
import 'package:limas_pizza/firebase/register_user.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool stateIconPassword = true;
  bool stateIconConfirmPassword = true;
  bool ? showError;


  void changeIconPassword() {
    setState(() {
      stateIconPassword = !stateIconPassword;
    });
  }

  void changeIconConfirmPassword(){
    setState(() {
      stateIconConfirmPassword = !stateIconConfirmPassword;
    });
  }

  void compairPasswords(){
    if(_confirmpasswordController.text != _passwordController.text){
      setState(() {
        showError = true;
      });
      Future.delayed(const Duration(seconds: 2), (){
        setState(() {
          showError = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 140, 69, 1) ,
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: Column(
          children: [
            Padding(
            padding:  EdgeInsets.all(55*screenWidth/430),
            child:  Text("Crie uma nova conta", 
            style: GoogleFonts.inter(
              fontSize: screenHeight*20/932,
              fontWeight: FontWeight.bold,
            ),),)
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
        ),
      ),
      body: Stack(
        children: [
          //Complement logo
          Positioned(
            bottom: 660 * screenHeight / 932,
            left: 74 * screenWidth / 430,
            child: Image.asset(
              "images/complement_logo.png",
              height: 240 * screenHeight / 932,
              width: 281.5 * screenWidth / 430,
            ),
          ),
          // Logo
          Positioned(
            bottom: 573 * screenHeight / 932,
            left: 74 * screenWidth / 430,
            child: Image.asset(
              "images/logo_login.png",
              height: 240 * screenHeight / 932,
              width: 281.5 * screenWidth / 430,
            ),
          ),
          Positioned(
            top:  330* screenHeight / 932,
            left: 36 * screenWidth / 430,
            child: Container(
              height: 58 * screenHeight / 932,
              width: 359 * screenWidth / 430,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(214, 221, 228, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Insira o nome",
                  hintStyle: TextStyle(
                    color: const Color.fromRGBO(112, 118, 124, 1),
                    fontSize: 20 * screenHeight / 932,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 27 * screenWidth / 430,
                    top: 15 * screenHeight / 932,
                  ),
                ),
              ),
            ),
          ),
          // Container to write the email
          Positioned(
            top: 400 * screenHeight / 932,
            left: 36 * screenWidth / 430,
            child: Container(
              height: 58 * screenHeight / 932,
              width: 359 * screenWidth / 430,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(214, 221, 228, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Insira o email",
                  hintStyle: TextStyle(
                    color: const Color.fromRGBO(112, 118, 124, 1),
                    fontSize: 20 * screenHeight / 932,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 27 * screenWidth / 430,
                    top: 15 * screenHeight / 932,
                  ),
                ),
              ),
            ),
          ),
          // container for password
          Positioned(
            top: 470 * screenHeight / 932,
            left: 36 * screenWidth / 430,
            child: Container(
              height: 58 * screenHeight / 932,
              width: 359 * screenWidth / 430,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(214, 221, 228, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: stateIconPassword,
                decoration: InputDecoration(
                  hintText: "Insira a senha",
                  hintStyle: TextStyle(
                    color: const Color.fromRGBO(112, 118, 124, 1),
                    fontSize: 20 * screenHeight / 932,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 27 * screenWidth / 430,
                    top: 15 * screenHeight / 932,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: changeIconPassword,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 23 * screenWidth / 430,
                        top: 13 * screenHeight / 932,
                      ),
                      child: Icon(
                        stateIconPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 540 * screenHeight / 932,
            left: 36 * screenWidth / 430,
            child: Container(
              height: 58 * screenHeight / 932,
              width: 359 * screenWidth / 430,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(214, 221, 228, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller: _confirmpasswordController,
                obscureText: stateIconConfirmPassword,
                decoration: InputDecoration(
                  hintText: "Repita a senha",
                  hintStyle: TextStyle(
                    color: const Color.fromRGBO(112, 118, 124, 1),
                    fontSize: 20 * screenHeight / 932,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 27 * screenWidth / 430,
                    top: 15 * screenHeight / 932,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: changeIconConfirmPassword,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 23 * screenWidth / 430,
                        top: 13 * screenHeight / 932,
                      ),
                      child: Icon(
                        stateIconConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 630*screenHeight/932,
            left: 120*screenWidth/430,
            child: GestureDetector(
              onTap: () async {
                compairPasswords();
                if (showError != true){
                   await ReGisterUser(_emailController.text, _confirmpasswordController.text);
                  addEmployee(_nameController.text);
                  Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
                }else{
                  print("senhas não compatíveis");
                }
              },
              child:Container(
                height: 58 * screenHeight / 932,
                width: 190 * screenWidth / 430,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 140, 69, 1),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 140, 69, 1),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Criar conta",
                    style: GoogleFonts.inter(
                      fontSize: 24 * screenHeight / 932,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(244, 249, 255, 1),
                    ),
                  ),
                ),
              ),)
            ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              "images/red_curve.png",
              width: screenWidth,
              height: 70 * screenHeight / 932,
            ),
          ),
          // Red points
          Positioned(
            bottom: 90 * screenWidth / 932,
            left: 0,
            child: Image.asset(
              "images/red_points.png",
              height: 100 * screenHeight / 932,
            ),
          ),
          if(showError == true)
            Positioned(
              top: screenHeight*720/932,
              left: 90*screenWidth/430,
              child: custom.ErrorWidget(screenHeight: screenHeight,screenWidth: screenWidth,),
            )
        ],
      ),
    );
  }
}