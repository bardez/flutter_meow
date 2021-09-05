// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$imageDataAtom = Atom(name: 'HomeStoreBase.imageData');

  @override
  Map<dynamic, dynamic> get imageData {
    _$imageDataAtom.reportRead();
    return super.imageData;
  }

  @override
  set imageData(Map<dynamic, dynamic> value) {
    _$imageDataAtom.reportWrite(value, super.imageData, () {
      super.imageData = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setImageData(dynamic data) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setImageData');
    try {
      return super.setImageData(data);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageData: ${imageData}
    ''';
  }
}
