// @dart=2.9

import 'package:flutter/material.dart';
import 'package:telegram_clone_app/pages/root_app.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(child: RootApp()),
  ));
}
