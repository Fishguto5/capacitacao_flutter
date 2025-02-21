import 'dart:io';
import 'package:flutter/material.dart';
import 'package:limas_pizza/components/admin/navigation_bar_admin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'dart:typed_data';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  XFile ? _image;

  Future<void> _pickImage() async {
  final ImagePicker picker = ImagePicker();

  // Solicitar permissão de armazenamento
  PermissionStatus permissionStatus = await Permission.photos.request();

  // Verificar se a permissão foi concedida
  if (permissionStatus.isGranted) {
    try {
  XFile? file = await picker.pickImage(source: ImageSource.gallery);
  if (file != null) {
    setState(() {
      _image = file;
    });
  }
} catch (e) {
  print("Erro ao selecionar imagem: $e");
}
  } else {
    // Caso a permissão não tenha sido concedida
    print("Permissão não concedida para acessar a galeria");
  }
}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar:NavigationBarAdmin(screenHeight: screenHeight, screenWidth: screenWidth),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20*screenHeight/932,),
            Row(
              children: [
                SizedBox(width: 23*screenWidth/430,),
                Icon(Icons.arrow_back_ios_new, 
                  size:screenHeight* 27/932,
                  color: const Color.fromRGBO(205, 33, 42, 1)),
                SizedBox(width: 20*screenWidth/430,),
                Text("Cardápios", 
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: screenHeight*30/932
                ),),
                SizedBox(
                  width: screenWidth*130/430,
                ),
                Icon(Icons.person,
                  color: const Color.fromRGBO(0, 140, 69, 1),
                  size: screenHeight*52/932)
              ],
            ),
            SizedBox(
              height:41*screenHeight/932,
            ),
            Stack(
              children: [
                Positioned(
                  child:Container(
                  height:190*screenHeight/932 ,
                  width: 190*screenHeight/932,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print("Icon edit selecionado");
                      _pickImage();
                      
                  } ,
                  child: const Icon(
                    Icons.edit,
                    color: Colors.grey
                    )),
                ),),
                Positioned(
                  top: 3.5*screenHeight/932,
                  left: 5*screenWidth/430,
                  child:Center(
                    child: CircleAvatar(
                    radius: 85,
                    backgroundColor: Colors.white,
                    backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
                    child: _image == null
                      ? Icon(Icons.image, size: 40, color: Colors.grey[700],)
                      :null,),
                  ))
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 369*screenWidth/430,
                ),
                const Icon(Icons.edit_rounded, size: 30,)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Título",
                    style: GoogleFonts.inter(
                     fontSize: 20*screenHeight/932,
                    fontWeight: FontWeight.w500),),
                ),
                Container(
                width: screenWidth*384/430,
                height: 59*screenHeight/932,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: const Color.fromRGBO(217, 217, 217, 1),),
                child:Center(
                  child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: InputBorder.none,
                      hintText: "Inserir nome/título",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 20*screenHeight/932,
                      )
                    ),
                  ),),),
            SizedBox(height: 17*screenHeight/932,),
            Padding(padding: const EdgeInsets.only(left: 20),
              child:SizedBox(width: 110,
                child:Text("Descrição",
                  style: GoogleFonts.inter(
                    fontSize: 20*screenHeight/932,
                    fontWeight: FontWeight.w500),), 
              ),),
            Container(
                width: screenWidth*384/430,
                height: 178*screenHeight/932,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: const Color.fromRGBO(217, 217, 217, 1),),
                  child: SingleChildScrollView(
                    child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: InputBorder.none,
                      hintText: "Inserir descrição",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 20*screenHeight/932,
                      )
                    ),),
                  ),),
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
                height: 59*screenHeight/932,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: const Color.fromRGBO(217, 217, 217, 1),),
                  child:Center(
                    child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: InputBorder.none,
                      hintText: "Inserir quantidade/tamanho",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 20*screenHeight/932,
                      )
                    ),
                    ),) ,),
              ],
            ),
            SizedBox(
                    height: 29*screenHeight/932,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 32*screenWidth/430),
                        child: const Icon(Icons.close,
                          color: Color.fromRGBO(205, 33, 42, 1),
                          size: 40,),
                      ),
                      SizedBox(width: 288*screenWidth/430,),
                      const Icon(Icons.check,
                      color: Color.fromRGBO(0, 140, 69, 1),
                      size: 40,
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}