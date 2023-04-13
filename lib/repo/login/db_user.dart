import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/model/user_model.dart';

class DbUser {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<bool> saveUser(UserModel userModel) async {
    await db.collection('user').doc(userModel.id).set(userModel.toMap());
    return true;
  }
}
