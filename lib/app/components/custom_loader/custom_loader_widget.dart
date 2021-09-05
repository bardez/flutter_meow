import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'loader_type_enum.dart';

Widget customLoaderWidget(LoaderType type) {
  switch (type) {
    case LoaderType.TextBox:
      return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Text(
          'Carregando...',
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        width: 200,
        height: 100,
      );
    case LoaderType.Animation1:
      return Container(
          alignment: Alignment.center,
          child: Lottie.asset(
              'resources/lottie_animations/loader_animation1.json'),
          height: 100);
    case LoaderType.Animation2:
      return Container(
          alignment: Alignment.center,
          child: Lottie.asset(
              'resources/lottie_animations/loader_animation2.json'),
          height: 100);
    case LoaderType.Cat:
      return Container(
          alignment: Alignment.center,
          child: Lottie.asset('resources/lottie_animations/loader_cat.json'),
          height: 100);
    default:
      return const CircularProgressIndicator();
  }
}
