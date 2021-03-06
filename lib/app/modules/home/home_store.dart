import 'package:flutter_meow/app/modules/home/repositories/home_repository.dart';
import 'package:flutter_meow/app/shared/models/response_handler_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final homeApi = Modular.get<HomeRepository>();
  
  @observable
  Map imageData = {};

  @action
  void setImageData(dynamic data) => imageData = data;

  Future<ResponseHandlerModel> getRandomGifCat() async {
    return await homeApi.fetchGifCat();
  }
  Future<ResponseHandlerModel> getNotFoundTag() async {
    return await homeApi.fecthNotFoundTag();
  }
}