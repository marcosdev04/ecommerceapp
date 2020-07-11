import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
//  FirebaseDatabase _database = FirebaseDatabase.instance;
  Firestore _firestore = Firestore.instance;

  //  String ref = "users";
  String collection = "users";

  void createUser(Map value){
    _firestore.collection(collection)
        .document(value["userId"])
        .setData(value);
  }

//  createUser(Map value) {
////    String id = value["userId"];
//
//    _database
//        .reference()
//        // Le enviamos el valor del uid que indentifica el registro para que sea el id del usuario
//        .child(ref)
//        .set(value)
//        .catchError((e) => {print(e.toString())});
//  }
}
