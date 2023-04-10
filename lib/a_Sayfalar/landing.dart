import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/a_Sayfalar/home.dart';
import 'package:myapp/a_Sayfalar/login.dart';
import 'package:myapp/repo/login/cikis_cubit.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CikisCubit>().kontrol();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return BlocConsumer<CikisCubit, bool>(
      buildWhen: (previousState, state) {
        // ignore: unnecessary_type_check
        return state is! bool;
      },
      builder: (BuildContext context, state) {
        return Text(state.toString());
      },
      listener: (BuildContext context, state) {
        if (state == false) {
        } else {}
      },
    );
  }
}
