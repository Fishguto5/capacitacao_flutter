import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:limas_pizza/components/admin/navigation_bar_admin.dart';
import 'package:limas_pizza/firebase/delete_product.dart';
import 'package:limas_pizza/firebase/get_producuts.dart';
import 'package:limas_pizza/screens/edit_product.dart';

class DescriptionProduct extends StatefulWidget {
  final String tastePizza;
  final String descriptionPizza;
  final String sizePizza;
  final String id;

  const DescriptionProduct({
    super.key,
    required this.tastePizza,
    required this.descriptionPizza,
    required this.sizePizza,
    required this.id
  });

  @override
  State<DescriptionProduct> createState() => _DescriptionProductState();
}

class _DescriptionProductState extends State<DescriptionProduct> {
  List<dynamic> teste = [];
  void carregarProdutos() async {
  List<dynamic> produtos = await fecthproducts(widget.id);
  setState(() {
    teste = produtos; // Atualiza a lista quando os dados estiverem disponíveis
  });
}
  @override
  void initState() {
  super.initState();
  carregarProdutos();
}
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: NavigationBarAdmin(screenHeight: screenHeight, screenWidth: screenWidth),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_new_outlined, size: 30*screenHeight/932, color: const Color.fromRGBO(205, 33, 42, 1)),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10),
                  child:Text(
                    "Cardápio",
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ) ,)
                  ,
                  SizedBox(width: 150*screenWidth/430,),
                  Icon(Icons.person, size: 52*screenHeight/932, color: Colors.green),
                ],
              ),
              SizedBox(height: 30),

              // Imagem da Pizza
              Center(
                child:Image.asset(
                "images/pizza.png",
                height: screenWidth * 243/430,
                width: screenWidth *243/430,
                )),
              SizedBox(height: 20),

              Text(
                teste[0],
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),

              Text(
                teste[1],
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // Tamanho da Pizza
              Text(
                "Tamanho: ${teste[2]}",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 38,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15*screenWidth/430,
                    ) ,
                    child: GestureDetector(
                      onTap: (){
                        print("Icon delete funcinando");
                        delete(widget.id);
                        Navigator.pop(context, true);
                      },
                      child:Icon(Icons.delete,
                  size: 44*screenHeight/932,
                  color: const Color.fromRGBO(205, 33, 42, 1),),),
                    ) ,
                  Padding(
                    padding:EdgeInsets.only(
                      left: 270*screenWidth/430,
                    ) ,
                    child: GestureDetector(
                      onTap: () async{
                        print("Icon edit está funcionando");
                        final result = await Navigator.push(
                          context,
                        MaterialPageRoute(builder: (context) => EditProduct(
                          pizzaName: teste[0], 
                          pizzaDescription: teste[1], 
                          pizzaSize: teste[2], id: widget.id,)));
                        if (result == true){
                          setState(() {
                            carregarProdutos();
                          });
                        }
                      },
                      child:Icon(Icons.edit,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      size: 44*screenHeight/932,),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
