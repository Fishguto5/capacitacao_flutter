import 'package:cloud_firestore/cloud_firestore.dart';
Future<List<Map<String, dynamic>>> getProducst() async {
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