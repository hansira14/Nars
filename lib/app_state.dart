import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<CareLevelsStruct> _careLevels = [
    CareLevelsStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Low\",\"level\":\"1\"}')),
    CareLevelsStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Normal\",\"level\":\"2\"}')),
    CareLevelsStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Medium\",\"level\":\"3\"}')),
    CareLevelsStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"High\",\"level\":\"4\"}')),
    CareLevelsStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Critical\",\"level\":\"5\"}'))
  ];
  List<CareLevelsStruct> get careLevels => _careLevels;
  set careLevels(List<CareLevelsStruct> _value) {
    _careLevels = _value;
  }

  void addToCareLevels(CareLevelsStruct _value) {
    _careLevels.add(_value);
  }

  void removeFromCareLevels(CareLevelsStruct _value) {
    _careLevels.remove(_value);
  }

  void removeAtIndexFromCareLevels(int _index) {
    _careLevels.removeAt(_index);
  }

  void updateCareLevelsAtIndex(
    int _index,
    CareLevelsStruct Function(CareLevelsStruct) updateFn,
  ) {
    _careLevels[_index] = updateFn(_careLevels[_index]);
  }

  void insertAtIndexInCareLevels(int _index, CareLevelsStruct _value) {
    _careLevels.insert(_index, _value);
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}
