import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/repo/btn/btn_cubit.dart';
import 'package:myapp/repo/btn/buton_tiklama_repo.dart';

// ignore: must_be_immutable
class CustomButton1 extends StatefulWidget {
  Function() onTop;

  double heigt;
  double width;
  Color butonColor;
  Widget widget1;
  Widget widget2;

  CustomButton1({
    super.key,
    required this.onTop,
    this.heigt = 100,
    this.width = 200,
    this.butonColor = Colors.grey,
    required this.widget1,
    required this.widget2,
  });

  @override
  State<CustomButton1> createState() => _CustomButton1State();
}

class _CustomButton1State extends State<CustomButton1> {
  var repo = BtnTiklamaRepo();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTop,
      child: BlocBuilder<BtnTiklamaCubit, bool>(
        builder: (context, state) {
          return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: widget.heigt,
              width: widget.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                ),
                color: widget.butonColor,
                boxShadow: state == false
                    ? []
                    : [
                        const BoxShadow(
                            color: Colors.black,
                            offset: Offset(6, 6),
                            blurRadius: 1,
                            spreadRadius: 3),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-2, -2),
                            blurRadius: 8,
                            spreadRadius: 1),
                      ],
              ),
              child: state == false ? widget.widget1 : widget.widget2);
        },
      ),
    );
  }
}
