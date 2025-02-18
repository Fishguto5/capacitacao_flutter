import 'package:cloud_firestore/cloud_firestore.dart';
Future<List<Map<String, dynamic>>> getProducst() async { //Gera uma Lista de Mapas dos produtos -> É usado lá no GridBuilder
  try{
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('products').get();
      return querySnapshot.docs.map((doc){
        return{
          'id' : doc.id,
         ... doc.data() as Map<String, dynamic>
        };
      }).toList();
  }catch (e){
    print("Erro ao buscar os dados $e");
    return [];
  }
}

Future<Map<String, dynamic>> getDocumentData(String id) async { //pega o documento da categoria products do Firebase
  try {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('products').doc(id).get();
    return doc.data() as Map<String, dynamic>;
  } catch (e) {
    print("Erro ao buscar o documento $e");
    return {};
  }
}

Future<List<String>> fecthproducts(String id) async { //Pega os dados individuais do documento da categoria "products" e gera uma lista com eles
  Map<String, dynamic> documentData = await getDocumentData(id);

  List<String> result = [];

  if (documentData.isNotEmpty) {
    String name = documentData['name'] ?? "Sem nome";
    String description = documentData['ingredients'] ?? "Sem descrição";
    String size = documentData['size'] ?? "Sem tamanho";

    result.addAll([name, description, size]);
  } else {
    print("Documento não encontrado ou vazio.");
  }

  return result;
}