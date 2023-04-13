import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  //*******************< GİRİŞ >************************ */
  Future<UserModel?> googleGiris() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      var googleAuthh = await googleUser.authentication;
      if (googleAuthh.idToken != null && googleAuthh.accessToken != null) {
        var sonuc = await firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuthh.idToken,
                accessToken: googleAuthh.accessToken));
        User? user = sonuc.user;
        UserModel usermodel = userConvert(user!);
        return usermodel;
      }
    }
    return null;
  }

  //*******************< ÇIKIŞ >************************ */
  Future<void> googleCikis() async {}
  UserModel userConvert(User user) {
    return UserModel(id: user.uid, mail: user.email.toString());
  }
}
