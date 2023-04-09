import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/a_Sayfalar/home.dart';
import 'package:myapp/repo/btn/btn_cubit.dart';
import 'package:myapp/repo/login/repo_login.dart';
import 'package:myapp/widget/buton.dart';
import 'package:myapp/widget/textfild.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var mailController = TextEditingController();

  var sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.08),
            lotti(),
            textFildVeButons(context),
            googleVeMisafirGirisButon(),
          ],
        ),
      )),
    );
  }

  void girisYap(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }

  void misafirGirisi() {
    debugPrint('Misafir Gİriş');
    try {
      LoginRepo().misafirGiris();
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void googleGirisi() {}

  Expanded googleVeMisafirGirisButon() {
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

  Expanded textFildVeButons(BuildContext context) {
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
            girisButonu(context)
          ],
        ));
  }

  CustomButton1 girisButonu(BuildContext context) {
    return CustomButton1(
        butonColor: Colors.white,
        heigt: Get.width / 6,
        width: Get.width / 2,
        onTop: () {
          context.read<BtnTiklamaCubit>().tiklama();
          Future.delayed(const Duration(seconds: 1), () => girisYap(context));
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
