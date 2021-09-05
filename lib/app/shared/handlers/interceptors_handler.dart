import 'dart:async';

import 'package:dio/dio.dart';
import '../models/response_handler_model.dart';

class InterceptorsHandler extends Interceptor {

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) {
    print('--------------[InterceptorsHandler/onError]:');
    print(err);
    ResponseHandlerModel response =
        ResponseHandlerModel(message: 'No Errors', status: true);

    if (err.type == DioErrorType.connectTimeout) {
      response.status = false;
      response.message = err.error;
    }

    if (err.type == DioErrorType.response) {
    //   response.status = false;
    //   // if (dioError.response!.statusCode == 423) {
    //   //   // Necessário Novo Login
    //   //   response.message = 'Please you need to sign in again.';
    //   //   Utils.clearLoggedUser();
    //   //   dbConfig.deleteKey(KEY_USER);
    //   //   Modular.to.pushReplacementNamed('/Login');
    //   // } else if (dioError.response.statusCode == 401) {
    //   //   response.message =
    //   //       'Auth failed. Please contact suport';
    //   // } else {
    //     response.message = dioError.error;
    //   // }
    // } else if (dioError.type == DioErrorType.other) {
      response.status = false;
      response.message = err.message;
    }
    return Future.value(response);
  }
}