import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:load/load.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

Future main() async{
  await dotenv.load(
    fileName: ".env"); 
  runApp(ModularApp(module: AppModule(), child: LoadingProvider(
      themeData: LoadingThemeData(
        tapDismiss: false,
      ),
      child: AppWidget(),
    ),));
}