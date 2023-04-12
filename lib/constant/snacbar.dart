import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SbtSnacbar {
  snacBarSucces(context, String title) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: Colors.green,
        maxLines: 6,
        textStyle: const TextStyle(color: Colors.black),
        message: title,
      ),
    );
  }

  void snacBarWhite(BuildContext context, String title) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
          backgroundColor: Colors.white,
          maxLines: 6,
          textStyle: const TextStyle(color: Colors.black),
          message: title),
    );
  }

  void snacBarError(BuildContext context, String title) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
          backgroundColor: Colors.white,
          maxLines: 6,
          textStyle: const TextStyle(color: Colors.black),
          message: title),
    );
  }
}
