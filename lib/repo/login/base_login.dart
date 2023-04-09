import 'package:myapp/model/user_model.dart';

abstract class BaseLogin {
  Future<UserModel?> userGiris();
  Future<UserModel?> misafirGiris();
  Future<bool> cikis();
}
