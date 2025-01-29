import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool state_icon_password = true;

  void initState(){
    super.initState();
  }

   void changeIconPassword (){
    setState(() { //o setState diz ao Flutter que o estado de alguma variável foi alterado e é necessário rederinzar tal estado novamente
     state_icon_password = !state_icon_password;
    });
    
  }
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
              fit: BoxFit.cover,
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
              fit: BoxFit.cover,
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
              fontWeight: FontWeight.w400))),
          Stack(
            children: [
              Positioned(
                top: 501*screenHeight/932,
                left: 36*screenWidth/430,
                child:Container(
                height: screenHeight*58/932,
                width: screenWidth*359/430,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(214, 221, 228, 1),
                  borderRadius: BorderRadius.circular(40)
                ),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: "Usuário",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(112, 118, 124, 1),
                      fontSize: screenHeight*20/932,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 27*screenWidth/430, top: 15*screenHeight/932),
                  ),
                ),
              )),
            ],
          ),
          Stack(
            children: [
              Positioned(
                top: 581*screenHeight/932,
                left: 36*screenWidth/430,
                child:Container(
                height: screenHeight*58/932,
                width: screenWidth*359/430,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(214, 221, 228, 1),
                  borderRadius: BorderRadius.circular(40)
                ),
                child:TextFormField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: "Senha",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(112, 118, 124, 1),
                      fontSize: screenHeight*20/932,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 27*screenWidth/430, top: 15*screenHeight/932),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 23*screenWidth/430, top:13*screenHeight/932 ),
                      child: GestureDetector(
                        onTap: changeIconPassword,
                      child: Icon(state_icon_password ? Icons.visibility : Icons.visibility_off, color: Colors.black,),
                      ),
                    )
                  ),
                  obscureText: state_icon_password,
                ),
              )),
              
            ],
          ),
          Stack( //Enter button
            children: [
              Positioned(
              top:672*screenHeight/932,
              left:134*screenWidth/430,
              child: GestureDetector(
                onTap: () => print("Botão está funfando"),
                child: Container(
                height:screenHeight*58/932,
                width: screenWidth*163/430,
                decoration: BoxDecoration( //para estilizar container's no flutter usamos esse atributo "decoration" e a classe "BoxDecoration" 
                //para alterar toda a estilização 
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromRGBO(0, 140, 69,1),
                border: Border.all( //altera a estilização da borda do botão, aqui podemos estamos alterando a cor da borda, 
                //mas podemos mudar outras coisas, basta apertar "ctrl + space" para ver as opções disponíveis
                  color: Color.fromRGBO(0, 140, 69, 1)
                )),
                child: Padding(
                  padding:EdgeInsets.only(left: 46*screenWidth/430,top: 14*screenHeight/932),
                  child:Text("Entrar", style: GoogleFonts.inter(
                  fontSize: screenHeight*24/932,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(244, 249, 255, 1)
                ),))),
              ) 
              )
            ],
          )
        ],
      ),
    );
  }
}
