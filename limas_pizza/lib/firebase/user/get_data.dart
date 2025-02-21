import 'package:cloud_firestore/cloud_firestore.dart';
Future<List<Map<String, dynamic>>> getData() async { //Gera uma Lista de Mapas dos produtos -> É usado lá no GridBuilder
  try{
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('employees').get();
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