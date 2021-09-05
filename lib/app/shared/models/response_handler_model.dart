class ResponseHandlerModel {
  String _message = 'No Message';
  bool _status = false;
  Map<String, dynamic>? _data;

  ResponseHandlerModel(
      {required String message, required bool status, Map<String, dynamic>? data}) {
    _message = message;
    _status = status;
    _data = data;
  }

  // ignore: unnecessary_getters_setters
  String get message => _message;
  // ignore: unnecessary_getters_setters
  set message(String message) => _message = message;
  // ignore: unnecessary_getters_setters
  bool get status => _status;
  // ignore: unnecessary_getters_setters
  set status(bool status) => _status = status;
  // ignore: unnecessary_getters_setters
  Map<String, dynamic> get data => _data!;
  // ignore: unnecessary_getters_setters
  set data(Map<String, dynamic> data) => _data = data;

  ResponseHandlerModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _status = json['status'];
    _data = (json['data'] != null
        ? Map<String, dynamic>.from(json['data'])
        : null)!;
  }

  dynamic toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = _message;
    data['status'] = _status;
    data['data'] = _data;
    return data;
  }
}
