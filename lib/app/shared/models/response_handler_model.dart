class ResponseHandlerModel {
  String _message = 'No Message';
  bool _status = false;
  List<Map<String, dynamic>>? _data;

  ResponseHandlerModel(
      {required String message, required bool status, List<Map<String, dynamic>>? data}) {
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
  List<Map<String, dynamic>> get data => _data!;
  // ignore: unnecessary_getters_setters
  set data(List<Map<String, dynamic>> data) => _data = data;

  ResponseHandlerModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _status = json['status'];
    _data = (json['data'] != null
        ? List<Map<String, dynamic>>.from(json['data'])
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
