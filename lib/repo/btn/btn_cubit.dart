import 'package:flutter/material.dart';

class BtnTiklama extends ChangeNotifier {
  bool tiklama = false;

  tiklamaState() {
    tiklama = !tiklama;
    notifyListeners();
  }
}
