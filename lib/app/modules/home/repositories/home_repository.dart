
import 'package:dio/dio.dart';
import 'package:flutter_meow/app/shared/models/response_handler_model.dart';
import 'package:flutter_meow/app/shared/utils/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@Injectable()
class HomeRepository extends Disposable {
  final Dio client;
  HomeRepository(this.client);

  Future<ResponseHandlerModel> fetchGifCat() async {
    try {
      final response = await client
          .get(dotenv.get('BASE_URL'));
      return ResponseHandlerModel(
          status: true,
          message: 'OK',
          data: response.data);
    } catch (e) {
      return ResponseHandlerModel(status: false, message: e.toString());
    }
  }

  Future<ResponseHandlerModel> fetchRandomCat() async {
    try {
      final response = await client
          .get(dotenv.get('BASE_URL'));
      return ResponseHandlerModel(
          status: response.data['status'],
          message: response.data['message'],
          data: response.data);
    } catch (e) {
      return ResponseHandlerModel(status: false, message: e.toString());
    }
  }

  Future<ResponseHandlerModel> fetchCatsWithText( String _text ) async {
    try {
      final response = await client
          .get(dotenv.get('BASE_URL') + CAT_WITH_TEXT_PATH + _text);
      return ResponseHandlerModel(
          status: response.data['status'],
          message: response.data['message'],
          data: response.data);
    } catch (e) {
      return ResponseHandlerModel(status: false, message: e.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}