import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/model/user_model.dart';
import 'package:myapp/repo/login/repo_login.dart';

class LoginCubit extends Cubit<UserModel?> {
  LoginCubit() : super(null);

  var mRepo = LoginRepo();

  kisiGetir() {}
}
