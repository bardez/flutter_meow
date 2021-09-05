import 'package:flutter/material.dart';
import 'package:flutter_meow/app/components/custom_loader/custom_loader.dart';
import 'package:flutter_meow/app/shared/models/response_handler_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';

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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(builder: (BuildContext context) { 
                if(store.imageData.isNotEmpty){
                  return Column(
                    children: [
                      FadeInImage.assetNetwork(placeholder: 'resources/loading.gif', image: store.imageData['image_original_url']),
                      Text(store.imageData['title'])
                    ],
                  );
                } else {
                  return Container();
                }
               },),
            ),
          ),
          
        ],
      ),
      floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          openCloseDial: isDialOpen,
          childPadding: const EdgeInsets.all(5),
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
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              label: 'Gif',
              onTap: () async{
                LoadingOverlay.of(context).show();
                ResponseHandlerModel response = await store.getRandomGifCat();
                LoadingOverlay.of(context).hide();
                if( response.status == true ){
                  store.setImageData(response.data['data']);
                } else {
                  showToast(response.message);
                }
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.error_sharp),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'Not found example',
              onTap: () async{
                LoadingOverlay.of(context).show();
                ResponseHandlerModel response = await store.getNotFoundTag();
                if( response.status == true ){
                  if(response.data['data'].length > 0){
                    store.setImageData(response.data['data']);
                  } else {
                    showToast('No images found for this tag');
                  }
                  LoadingOverlay.of(context).hide();
                } else {
                  showToast(response.message);
                }
              },
            ),
          ],
        ),
      )
    );
  }
}