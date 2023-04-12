import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/model/user_model.dart';
import 'package:myapp/repo/login/base_auth.dart';
import 'package:myapp/repo/login/mixin_user.dart';

class MyLoginServices with ConverUser implements BaseAuth {
  var firebase = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  UserModel? userModel;
  //? ***********< SİGN >***********
  Future<UserModel?> signFirebasea(
      {required String pasword, required String mail}) async {
    try {
      var gelenKisi = await firebase.signInWithEmailAndPassword(
          email: mail, password: pasword);
      userModel = userConvert(gelenKisi);
      return userModel;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

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
  Future<void> signOuth() async {
    await firebase.signOut();
    if (googleSignIn.currentUser != null) {
      await googleSignIn.disconnect();
    }
  }
  //? ***********< CHANCE >***********

  @override
  Stream<UserModel> get screeChance => firebase
      .authStateChanges()
      .map((event) => UserConvert().userConvert(event!));
  //? ***********< RESET >***********

  Future<void> resetPassword(String email) async {
    try {
      await firebase.sendPasswordResetEmail(email: email);
      debugPrint('Başarılı');
    } catch (e) {
      debugPrint('Redd');

      debugPrint(e.toString());
      // Handle the error here, such as displaying a message to the user
    }
  }
}

class UserConvert {
  UserModel userConvert(User user) {
    return UserModel(id: user.uid, mail: user.email.toString());
  }
}
