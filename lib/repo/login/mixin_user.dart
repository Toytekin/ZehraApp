import 'package:firebase_auth/firebase_auth.dart';

import '../../model/user_model.dart';

mixin ConverUser {
  UserModel userConvert(UserCredential userCredential) {
    return UserModel(
        id: userCredential.user!.uid, name: userCredential.user!.uid);
  }
}
