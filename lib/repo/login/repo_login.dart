import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/model/user_model.dart';
import 'package:myapp/repo/login/base_auth.dart';
import 'package:myapp/repo/login/mixin_user.dart';

class MyLoginServices with ConverUser implements BaseAuth {
  var firebase = FirebaseAuth.instance;
  UserModel? userModel;

  //? ***********< CREATE >***********
  @override
  Future<UserModel?> creatAnonimUser() async {
    var olusanKisi = await firebase.signInAnonymously();
    userModel = userConvert(olusanKisi);

    return userModel;
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
    return UserModel(id: user.uid, name: user.uid);
  }
}
