import 'package:flutter/material.dart';
import 'package:myapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  FirebaseAuth firebase = FirebaseAuth.instance;

  Future<void> cikis() async {
    await firebase.signOut();
  }

  Future<bool> usurKontrol() async {
    // ignore: unrelated_type_equality_checks
    if (firebase.currentUser == false) {
      return false;
    } else {
      return true;
    }
  }

  Future<UserModel?> misafirGiris() async {
    var kisi = await firebase.signInAnonymously();

    try {
      debugPrint('oluştu');
      return fireUserFromUserModel(kisi);
    } catch (e) {
      debugPrint('Hata: Mİsafir giris$e');
      return null;
    }
  }

  UserModel fireUserFromUserModel(UserCredential userCredential) {
    var user = UserModel(
        id: userCredential.user!.email == null
            ? 'Deneme'
            : userCredential.user!.email.toString(),
        name: userCredential.user!.uid);
    return user;
  }
}
