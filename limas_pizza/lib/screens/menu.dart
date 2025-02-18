import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:limas_pizza/components/admin/navigation_bar_admin.dart';
import 'package:limas_pizza/components/container_product.dart';
import 'package:limas_pizza/firebase/get_producuts.dart';
import 'package:limas_pizza/screens/description_product.dart';
 

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController _search = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Stack(
              children: [
            Positioned(
            top: screenHeight*29/932,
            left: 23*screenWidth/430,
            child:Text("Cardápio", style: GoogleFonts.inter(
              fontSize: 40*screenHeight/932,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(38, 38, 38, 1),
            )) ),
            Positioned(
              top: screenHeight*27/932,
              right: 23*screenWidth/430,
              child: Icon(
                Icons.person,
                color: const Color.fromRGBO(0, 140, 69, 1),
                size: screenHeight*52/932,
                )),
              Positioned(
                top: screenHeight*114/932,
                left: 23*screenWidth/430 ,
                child: Container(
                  height: screenHeight*46/932,
                  width: 384*screenWidth/430,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: const Color.fromRGBO(217, 217, 217, 1),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10*screenHeight/932,
                        left: 20*screenWidth/430,
                        child:Icon(Icons.search,
                        size: screenHeight*24/932,
                        color: const Color.fromRGBO(112, 118, 124, 1),
                        ),),
                      TextField(
                        controller: _search,
                        decoration: InputDecoration(
                          hintText: "Buscar em cardápio",
                          hintStyle: TextStyle(
                          color:  const Color.fromRGBO(112, 118, 124, 1),
                          fontSize: 16 * screenHeight / 932,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 54*screenWidth/430,top: -5*screenHeight/932)
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
              Positioned(
                top: 180 * screenHeight / 932,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: screenHeight - (180 * screenHeight / 932), // Ajusta altura
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: getProducst(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text('Erro ao carregar dados'));
                      } else {
                        List<Map<String, dynamic>> products = snapshot.data ?? [];
                        return GridView.builder(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 3,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async{
                                print("Rota para produto selecionado");
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DescriptionProduct(
                                    tastePizza: products[index]['name'] ?? 'Sem nome', 
                                    descriptionPizza: products[index]['ingredients'] ?? 'Sem ingredientes',
                                    sizePizza: products[index]['size'] ?? 'Sem tamanho',
                                    id: products[index]['id'],)));
                                  if(result == true){
                                    setState(() {});
                                  }
                              },
                              child:ContainerProduct(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth, 
                              tastePizza: products[index]['name'] ?? 'Sem nome',
                              description: products[index]['ingredients'] ?? 'Sem ingredientes',
                              size: products[index]['size'] ?? 'Sem tamanho',
                            ) ,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              Positioned(
                top: 755*screenHeight/932,
                right: 23*screenWidth/430,
                child: GestureDetector(
                  onTap: (){
                    print('Botão adicionar está funcionando');
                  },
                  child: Container(
                  height: 64*screenHeight/932,
                  width: 64*screenHeight/932,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(205, 33, 42, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: 
                    Icon(Icons.add,
                        color:  const Color.fromRGBO(255, 255, 255, 1),
                        size: 34*screenHeight/932,
                        grade: 30,
                    ),
                  ),
                ),
                )),            
              Positioned(
                bottom: 0,
                child: NavigationBarAdmin(screenHeight: screenHeight, screenWidth: screenWidth))
        ],
      ),
    );
  }
}