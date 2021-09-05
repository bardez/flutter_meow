import 'package:flutter/material.dart';
import 'package:flutter_meow/app/components/custom_loader/custom_loader.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  ValueNotifier<bool> isDialOpen = ValueNotifier<bool>(false);
  SpeedDialDirection speedDialDirection = SpeedDialDirection.Up;
  FloatingActionButtonLocation selectedfABLocation = FloatingActionButtonLocation.endDocked;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
      appBar: AppBar(
        title: const Text('Meow!!!'),
      ),
      body: Container(),
      floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          openCloseDial: isDialOpen,
          childPadding: EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          buttonSize: 56,
          visible: true,
          direction: speedDialDirection,
          closeManually: false,
          renderOverlay: true,
          useRotationAnimation: true,
          tooltip: 'view new Cat',
          heroTag: 'speed-dial-hero-tag',
          elevation: 8.0,
          isOpenOnStart: false,
          animationSpeed: 200,
          // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.gif),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'Gif',
              onTap: () => LoadingOverlay.of(context).during(Future.delayed(const Duration(seconds: 5))),
            ),
            SpeedDialChild(
              child: const Icon(Icons.help_sharp),
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'Random',
              onTap: () => print('SECOND CHILD'),
            ),
            SpeedDialChild(
              child: const Icon(Icons.text_format),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              label: 'With text',
              onTap: () => print('THIRD CHILD'),
            ),
          ],
        ),
      )
    );
  }
}