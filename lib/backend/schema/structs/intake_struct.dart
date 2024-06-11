// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntakeStruct extends FFFirebaseStruct {
  IntakeStruct({
    int? volume,
    String? type,
    DateTime? time,
    String? note,
    bool? isIntake,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _volume = volume,
        _type = type,
        _time = time,
        _note = note,
        _isIntake = isIntake,
        super(firestoreUtilData);

  // "volume" field.
  int? _volume;
  int get volume => _volume ?? 0;
  set volume(int? val) => _volume = val;
  void incrementVolume(int amount) => _volume = volume + amount;
  bool hasVolume() => _volume != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;
  bool hasTime() => _time != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;
  bool hasNote() => _note != null;

  // "isIntake" field.
  bool? _isIntake;
  bool get isIntake => _isIntake ?? false;
  set isIntake(bool? val) => _isIntake = val;
  bool hasIsIntake() => _isIntake != null;

  static IntakeStruct fromMap(Map<String, dynamic> data) => IntakeStruct(
        volume: castToType<int>(data['volume']),
        type: data['type'] as String?,
        time: data['time'] as DateTime?,
        note: data['note'] as String?,
        isIntake: data['isIntake'] as bool?,
      );

  static IntakeStruct? maybeFromMap(dynamic data) =>
      data is Map ? IntakeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'volume': _volume,
        'type': _type,
        'time': _time,
        'note': _note,
        'isIntake': _isIntake,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'volume': serializeParam(
          _volume,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'isIntake': serializeParam(
          _isIntake,
          ParamType.bool,
        ),
      }.withoutNulls;

  static IntakeStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntakeStruct(
        volume: deserializeParam(
          data['volume'],
          ParamType.int,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        isIntake: deserializeParam(
          data['isIntake'],
          ParamType.bool,
          false,
        ),
      );

  static IntakeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      IntakeStruct(
        volume: convertAlgoliaParam(
          data['volume'],
          ParamType.int,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        time: convertAlgoliaParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        note: convertAlgoliaParam(
          data['note'],
          ParamType.String,
          false,
        ),
        isIntake: convertAlgoliaParam(
          data['isIntake'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'IntakeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IntakeStruct &&
        volume == other.volume &&
        type == other.type &&
        time == other.time &&
        note == other.note &&
        isIntake == other.isIntake;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([volume, type, time, note, isIntake]);
}

IntakeStruct createIntakeStruct({
  int? volume,
  String? type,
  DateTime? time,
  String? note,
  bool? isIntake,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IntakeStruct(
      volume: volume,
      type: type,
      time: time,
      note: note,
      isIntake: isIntake,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IntakeStruct? updateIntakeStruct(
  IntakeStruct? intake, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    intake
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIntakeStructData(
  Map<String, dynamic> firestoreData,
  IntakeStruct? intake,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (intake == null) {
    return;
  }
  if (intake.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && intake.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final intakeData = getIntakeFirestoreData(intake, forFieldValue);
  final nestedData = intakeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = intake.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIntakeFirestoreData(
  IntakeStruct? intake, [
  bool forFieldValue = false,
]) {
  if (intake == null) {
    return {};
  }
  final firestoreData = mapToFirestore(intake.toMap());

  // Add any Firestore field values
  intake.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIntakeListFirestoreData(
  List<IntakeStruct>? intakes,
) =>
    intakes?.map((e) => getIntakeFirestoreData(e, true)).toList() ?? [];
