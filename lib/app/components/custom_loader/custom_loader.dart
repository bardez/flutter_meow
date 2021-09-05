import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_loader_widget.dart';
import 'loader_type_enum.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (_) {
          return const CustomLoader();
        });
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class CustomLoader extends StatelessWidget {
  final LoaderType loaderType = LoaderType.Cat;
  const CustomLoader({loaderType });
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: Center(child: customLoaderWidget(loaderType)));
  }
}
