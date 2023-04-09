import 'package:flutter/material.dart';
import 'package:myapp/model/user_model.dart';
import 'package:myapp/repo/login/base_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo extends BaseLogin {
  FirebaseAuth firebase = FirebaseAuth.instance;

  @override
  Future<bool> cikis() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> misafirGiris() async {
    var kisi = await firebase.signInAnonymously();
    try {
      return fireUserFromUserModel(kisi);
    } catch (e) {
      debugPrint('Hata: Mİsafir giris$e');
      return null;
    }
  }

  @override
  Future<UserModel> userGiris() async {
    UserModel gelenUser = UserModel(id: '123', name: 'İbrahim Toytekin');
    return gelenUser;
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
