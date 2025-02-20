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
  File ? _image;

  Future<void> _pickImage() async {
  // Verifica a permissão correta dependendo da versão do Android
  if (Platform.isAndroid) {
    if (await Permission.photos.isDenied) {
      await Permission.photos.request();
    }
    if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }
  }

  // Abre a galeria apenas se a permissão foi concedida
  if (await Permission.photos.isGranted || await Permission.storage.isGranted) {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print("Nenhuma imagem selecionada.");
    }
  } else {
    print("Permissão negada. Não é possível acessar a galeria.");
  }
}

  // Uint8List? _imageBytes;

  // Future<void> _pickImage2() async {
  //   final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     final bytes = await pickedFile.readAsBytes();
  //     setState(() {
  //       _imageBytes = bytes;
  //     });
  //   }
  // }


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
                  height:180*screenHeight/932 ,
                  width: 180*screenHeight/932,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(onPressed: _pickImage, 
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.grey)),
                ),),
                Positioned(
                  top: 3.5*screenHeight/932,
                  left: 5*screenWidth/430,
                  child:CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  
                  child: _image == null
                    ? Icon(Icons.image, size: 40, color: Colors.grey[700],)
                    :null,
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
                  padding: EdgeInsets.only(left: 20),
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