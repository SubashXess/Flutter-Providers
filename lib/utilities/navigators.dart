import 'package:flutter/material.dart';

void nextScreenNavigator(context, page) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}
