import 'package:cloud_firestore/cloud_firestore.dart';

void delete (String id) async {
    var documentReference = FirebaseFirestore.instance
        .collection("products")
        .doc(id);
    await documentReference.delete().whenComplete(() {
      print("Data has been Deleted ");
    }).onError((error, stackTrace) {
      print(error.toString());
    });
}