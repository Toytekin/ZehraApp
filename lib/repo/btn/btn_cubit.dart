import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/repo/btn/buton_tiklama_repo.dart';

class BtnTiklamaCubit extends Cubit<bool> {
  BtnTiklamaCubit() : super(false);

  var mRepo = BtnTiklamaRepo();

  void tiklama() {
    var deger = mRepo.tiklandi();
    emit(deger);
  }
}
