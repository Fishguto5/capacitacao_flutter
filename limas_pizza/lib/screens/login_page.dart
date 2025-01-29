import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:limas_pizza/login_firebase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool state_icon_password = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void changeIconPassword() {
    setState(() {
      state_icon_password = !state_icon_password;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Green curve
          Positioned(
            top: 0,
            child: Image.asset(
              "images/green_curve.png",
              width: screenWidth,
              height: 70 * screenHeight / 932,
              fit: BoxFit.cover,
            ),
          ),
          // Green points
          Positioned(
            top: 44 * screenHeight / 932,
            right: 0,
            child: Image.asset(
              "images/green_points.png",
              height: 100 * screenHeight / 932,
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
          // Red curve
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
          // Login text
          Positioned(
            top: 410 * screenHeight / 932,
            left: 153 * screenWidth / 430,
            child: Text(
              "Login",
              style: GoogleFonts.inter(
                fontSize: 48 * screenHeight / 932,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Email field
          Positioned(
            top: 501 * screenHeight / 932,
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
                  hintText: "Usuário",
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
          // Password field
          Positioned(
            top: 581 * screenHeight / 932,
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
                obscureText: state_icon_password,
                decoration: InputDecoration(
                  hintText: "Senha",
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
                        state_icon_password
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
          // Enter button
          Positioned(
            top: 672 * screenHeight / 932,
            left: 134 * screenWidth / 430,
            child: GestureDetector(
              onTap: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                if (email.isNotEmpty && password.isNotEmpty) {
                  loginUser(email, password);
                }
              },
              child: Container(
                height: 58 * screenHeight / 932,
                width: 163 * screenWidth / 430,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 140, 69, 1),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 140, 69, 1),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Entrar",
                    style: GoogleFonts.inter(
                      fontSize: 24 * screenHeight / 932,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(244, 249, 255, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}