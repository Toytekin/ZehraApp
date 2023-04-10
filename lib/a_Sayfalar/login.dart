import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../repo/btn/btn_cubit.dart';
import '../repo/login/repo_login.dart';
import '../widget/buton.dart';
import '../widget/textfild.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  BuildContext context;
  LoginScreen({super.key, required this.context});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var mailController = TextEditingController();

  var sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var btnProvider = Provider.of<BtnTiklama>(context, listen: false);

    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.08),
            lotti(),
            textFildVeButons(context, btnProvider),
            googleVeMisafirGirisButon(context),
          ],
        ),
      )),
    );
  }

  void girisYap(context) {}

  Future<void> misafirGirisi() async {
    await Provider.of<MyLoginServices>(context, listen: false)
        .creatAnonimUser();
  }

  void googleGirisi() {}

  Expanded googleVeMisafirGirisButon(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                googleGirisi();
              },
              child: SizedBox(
                width: Get.width / 6,
                height: Get.width / 6,
                child: Card(
                  child: Image.asset(
                    'asset/google.png',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                misafirGirisi();
              },
              child: SizedBox(
                width: Get.width / 6,
                height: Get.width / 6,
                child: const Card(
                  child: Icon(Icons.person_3_sharp, size: 50),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        )
      ],
    ));
  }

  Expanded textFildVeButons(BuildContext context, BtnTiklama btnprovider) {
    return Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SbtTextFild(
                textEditingController: mailController,
                hintText: 'Mail veya Kullanıcı adı'),
            SbtTextFild(
                textEditingController: sifreController, hintText: 'Şifre'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Şifreni mi Unuttun ?',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            girisButonu(context, btnprovider)
          ],
        ));
  }

  CustomButton1 girisButonu(BuildContext context, BtnTiklama btnTiklama) {
    return CustomButton1(
        butonColor: Colors.white,
        heigt: Get.width / 6,
        width: Get.width / 2,
        onTop: () {
          btnTiklama.tiklamaState();
        },
        widget2: const Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        )),
        widget1: const Center(child: Text('Giriş Yap')));
  }

  Expanded lotti() {
    return Expanded(
        flex: 1,
        child: Center(
          child: Lottie.asset(
            'asset/login.json',
            fit: BoxFit.cover,
          ),
        ));
  }
}
