import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return OKToast(
          child: widget!,
        );
      },
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}