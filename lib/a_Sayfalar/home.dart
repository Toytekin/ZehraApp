import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/a_Sayfalar/landing.dart';
import 'package:myapp/repo/login/login_cubit.dart';

class HomeScreen extends StatefulWidget {
  BuildContext context;
  HomeScreen({super.key, required this.context});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deneme'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<LoginCubit>().cikisYap();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LandingScreen(),
                    ),
                    (route) => false);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: const Center(),
    );
  }
}
