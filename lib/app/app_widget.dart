import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:load/load.dart';

import 'components/custom_loader/custom_loader.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}