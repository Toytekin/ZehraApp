import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/repo/login/repo_login.dart';

class CikisCubit extends Cubit<bool> {
  CikisCubit() : super(false);

  var mRepo = LoginRepo();

  kontrol() async {
    var deger = await mRepo.usurKontrol();
    emit(deger);
  }
}
