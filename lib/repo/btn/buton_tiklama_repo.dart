class BtnTiklamaRepo {
  bool tiklanmaOnayRed = false;

  bool tiklandi() {
    if (tiklanmaOnayRed == false) {
      tiklanmaOnayRed = true;
      return tiklanmaOnayRed;
    } else {
      tiklanmaOnayRed = false;
      return tiklanmaOnayRed;
    }
  }
}
