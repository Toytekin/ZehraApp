import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/model/user_model.dart';
import 'package:myapp/repo/login/base_auth.dart';
import 'package:myapp/repo/login/mixin_user.dart';

class MyLoginServices with ConverUser implements BaseAuth {
  var firebase = FirebaseAuth.instance;
  UserModel? userModel;

  //? ***********< CREATE >***********
  @override
  Future<UserModel?> creatAnonimUser(
      {required String pasword, required String mail}) async {
    try {
      var olusanKisi = await firebase.createUserWithEmailAndPassword(
          email: mail, password: pasword);
      userModel = userConvert(olusanKisi);
      return userModel;
    } on FirebaseAuthException catch (k) {
      debugPrint('User zaten var  :$k');
      return null;
    } catch (e) {
      debugPrint('user oluşturma hatası  :$e');
      return null;
    }
  }

  Future<String?> userKontrolVeKayit(
      {required String pasword, required String mail}) async {
    try {
      var olusanKisi = await firebase.createUserWithEmailAndPassword(
          email: mail, password: pasword);
      userModel = userConvert(olusanKisi);
      return null;
    } on FirebaseAuthException catch (k) {
      debugPrint('User zaten var  :$k');
      return null;
    } catch (e) {
      debugPrint('user oluşturma hatası  :$e');
      return null;
    }
  }

  //? ***********< OUTH >***********

  @override
  Future<void> signOuth() {
    return firebase.signOut();
  }
  //? ***********< CHANCE >***********

  @override
  Stream<UserModel> get screeChance => firebase
      .authStateChanges()
      .map((event) => UserConvert().userConvert(event!));
}

class UserConvert {
  UserModel userConvert(User user) {
    return UserModel(id: user.uid, mail: user.uid);
  }
}
