import 'dart:ui';

import 'package:flutter/material.dart';

Future<void> showLoadingDialog(context) {
  return showDialog(
    context: context,
    useSafeArea: true,
    barrierDismissible: false,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Center(
        child: Container(
          height: 75.0,
          width: 75.0,
          padding: const EdgeInsets.all(25.0),
          clipBehavior: Clip.none,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const CircularProgressIndicator(
            color: Colors.indigo,
            strokeWidth: 5.0,
          ),
        ),
      ),
    ),
  );
}

Widget showLoadingDialog2() {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
    child: Center(
      child: Container(
        height: 75.0,
        width: 75.0,
        padding: const EdgeInsets.all(25.0),
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const CircularProgressIndicator(
          color: Colors.indigo,
          strokeWidth: 6.0,
        ),
      ),
    ),
  );
}
