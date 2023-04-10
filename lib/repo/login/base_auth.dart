import '../../model/user_model.dart';

abstract class BaseAuth {
  Future<UserModel?> creatAnonimUser();
  Future<void> signOuth();
  Stream<UserModel?> get screeChance;
}
