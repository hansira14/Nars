// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CareLevelsStruct extends FFFirebaseStruct {
  CareLevelsStruct({
    String? name,
    int? level,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _level = level,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  set level(int? val) => _level = val;
  void incrementLevel(int amount) => _level = level + amount;
  bool hasLevel() => _level != null;

  static CareLevelsStruct fromMap(Map<String, dynamic> data) =>
      CareLevelsStruct(
        name: data['name'] as String?,
        level: castToType<int>(data['level']),
      );

  static CareLevelsStruct? maybeFromMap(dynamic data) => data is Map
      ? CareLevelsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'level': _level,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'level': serializeParam(
          _level,
          ParamType.int,
        ),
      }.withoutNulls;

  static CareLevelsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CareLevelsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        level: deserializeParam(
          data['level'],
          ParamType.int,
          false,
        ),
      );

  static CareLevelsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CareLevelsStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        level: convertAlgoliaParam(
          data['level'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CareLevelsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CareLevelsStruct &&
        name == other.name &&
        level == other.level;
  }

  @override
  int get hashCode => const ListEquality().hash([name, level]);
}

CareLevelsStruct createCareLevelsStruct({
  String? name,
  int? level,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CareLevelsStruct(
      name: name,
      level: level,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CareLevelsStruct? updateCareLevelsStruct(
  CareLevelsStruct? careLevels, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    careLevels
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCareLevelsStructData(
  Map<String, dynamic> firestoreData,
  CareLevelsStruct? careLevels,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (careLevels == null) {
    return;
  }
  if (careLevels.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && careLevels.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final careLevelsData = getCareLevelsFirestoreData(careLevels, forFieldValue);
  final nestedData = careLevelsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = careLevels.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCareLevelsFirestoreData(
  CareLevelsStruct? careLevels, [
  bool forFieldValue = false,
]) {
  if (careLevels == null) {
    return {};
  }
  final firestoreData = mapToFirestore(careLevels.toMap());

  // Add any Firestore field values
  careLevels.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCareLevelsListFirestoreData(
  List<CareLevelsStruct>? careLevelss,
) =>
    careLevelss?.map((e) => getCareLevelsFirestoreData(e, true)).toList() ?? [];
