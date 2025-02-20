import 'package:flutter/material.dart';
import 'package:limas_pizza/components/admin/navigation_bar_admin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:limas_pizza/height_text.dart';
import 'package:limas_pizza/firebase/update_products.dart';
import 'package:limas_pizza/firebase/get_producuts.dart';
class EditProduct extends StatefulWidget {
  final String pizzaName;
  final String pizzaDescription;
  final String pizzaSize;
  final String id;
  const EditProduct({
    super.key,
    required this.pizzaName,
    required this.pizzaDescription,
    required this.pizzaSize,
    required this.id
  });
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  late String newTextTitle;
  late String newTextIngredients;
  late String newTextSize;

  @override
  void initState() {
    super.initState();
    newTextTitle = widget.pizzaName;
    newTextIngredients = widget.pizzaDescription;
    newTextSize = widget.pizzaSize;
  }

  @override
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
              const SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_new_outlined, size: 30*screenHeight/932, color: const Color.fromRGBO(205, 33, 42, 1)),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 10),
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
              SizedBox(height: 17*screenHeight/932),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "images/pizza2.jpg",
                height: 243,
                width: 243,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: screenWidth*340/430),
              child: const Icon(Icons.mode_edit_outline_outlined,
                size: 40),
               ),
            const SizedBox(height: 15),
            Padding(padding: const EdgeInsets.only(left: 33),
              child:SizedBox(width: 10,
               child:Text("Título",
                style: GoogleFonts.inter(
                  fontSize: 20*screenHeight/932,
                  fontWeight: FontWeight.w500),), 
               ),),
            Container(
              width: screenWidth*384/430,
              height: calculateHeightText(widget.pizzaName, screenWidth*384/430) + 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color.fromRGBO(217, 217, 217, 1),),
              child:Center(
                child: TextFormField(
                  initialValue: widget.pizzaName,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 20*screenHeight/932,
                    )
                  ),
                  onChanged: (value){
                    newTextTitle = value;
                  },
                ),),),

              //Description part
              SizedBox(height: 17*screenHeight/932,),
              Padding(padding: const EdgeInsets.only(left: 33),
              child:SizedBox(width: 110,
               child:Text("Descrição",
                style: GoogleFonts.inter(
                  fontSize: 20*screenHeight/932,
                  fontWeight: FontWeight.w500),), 
               ),),
            Container(
              width: screenWidth*384/430,
              height: calculateHeightText(widget.pizzaDescription, screenWidth*384/430) + 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color.fromRGBO(217, 217, 217, 1),),
                child: Center(
                  child: TextFormField(
                  initialValue: widget.pizzaDescription,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 20*screenHeight/932,
                    )
                  ),
                  onChanged: (value){
                    newTextIngredients = value;
                  },
                                ),
                ),),

            //Size part
            SizedBox(height: 17*screenHeight/932,),
            Padding(padding: const EdgeInsets.only(left: 33),
              child:SizedBox(width:120,
               child:Text("Quantidade",
                style: GoogleFonts.inter(
                  fontSize: 20*screenHeight/932,
                  fontWeight: FontWeight.w500),), 
               ),),
            Container(
              width: screenWidth*384/430,
              height: calculateHeightText(widget.pizzaSize, screenWidth*384/430) + 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color.fromRGBO(217, 217, 217, 1),),
                child:Center(
                  child: TextFormField(
                  initialValue: widget.pizzaSize,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 20*screenHeight/932,
                    )
                  ),
                  onChanged: (value){
                    newTextSize = value;
                  },
                                ),
                ) ,),
              const SizedBox(height: 30,),
              Align(
                alignment: Alignment(20,771*screenHeight/932),
                child: Row(
                  children: [
                    GestureDetector(
                  onTap: (){
                    print("Icon X acionado");
                  },
                  child: Icon(Icons.close,
                    size: 50*screenHeight/932,
                    color: const Color.fromRGBO(205, 33, 42, 1),),
                ),
                  Padding(padding: EdgeInsets.only(
                    left: 288*screenWidth/430
                  ),
                  child:GestureDetector(
                    onTap: () async{
                    await updateProduct(
                      widget.id, 
                      newTextTitle , 
                      newTextIngredients, 
                      newTextSize);
                      Navigator.pop(context, true);
                  },
                  child: Icon(Icons.check_circle_outlined,
                    size: 50*screenHeight/932,
                    color: const Color.fromRGBO(0, 140, 69, 1),),
                  ),) 
                  ],
                ))
            ]
          ),
    )));
  }
}