import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/constants/themes.dart';

ScaffoldMessengerState showSnackBar(
  context, {
  Color color = Colors.indigo,
  required String content,
}) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        behavior: SnackBarBehavior.floating,
        content: Text(
          content,
          style: AppTextStyle.h0TextStyle(color: Colors.white, size: 15.0),
        ),
        backgroundColor: color,
      ),
    );
}
