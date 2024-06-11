// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsightsoverallStruct extends FFFirebaseStruct {
  InsightsoverallStruct({
    int? total,
    int? newp,
    int? old,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _total = total,
        _newp = newp,
        _old = old,
        super(firestoreUtilData);

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;
  void incrementTotal(int amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "newp" field.
  int? _newp;
  int get newp => _newp ?? 0;
  set newp(int? val) => _newp = val;
  void incrementNewp(int amount) => _newp = newp + amount;
  bool hasNewp() => _newp != null;

  // "old" field.
  int? _old;
  int get old => _old ?? 0;
  set old(int? val) => _old = val;
  void incrementOld(int amount) => _old = old + amount;
  bool hasOld() => _old != null;

  static InsightsoverallStruct fromMap(Map<String, dynamic> data) =>
      InsightsoverallStruct(
        total: castToType<int>(data['total']),
        newp: castToType<int>(data['newp']),
        old: castToType<int>(data['old']),
      );

  static InsightsoverallStruct? maybeFromMap(dynamic data) => data is Map
      ? InsightsoverallStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total': _total,
        'newp': _newp,
        'old': _old,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'newp': serializeParam(
          _newp,
          ParamType.int,
        ),
        'old': serializeParam(
          _old,
          ParamType.int,
        ),
      }.withoutNulls;

  static InsightsoverallStruct fromSerializableMap(Map<String, dynamic> data) =>
      InsightsoverallStruct(
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        newp: deserializeParam(
          data['newp'],
          ParamType.int,
          false,
        ),
        old: deserializeParam(
          data['old'],
          ParamType.int,
          false,
        ),
      );

  static InsightsoverallStruct fromAlgoliaData(Map<String, dynamic> data) =>
      InsightsoverallStruct(
        total: convertAlgoliaParam(
          data['total'],
          ParamType.int,
          false,
        ),
        newp: convertAlgoliaParam(
          data['newp'],
          ParamType.int,
          false,
        ),
        old: convertAlgoliaParam(
          data['old'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'InsightsoverallStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InsightsoverallStruct &&
        total == other.total &&
        newp == other.newp &&
        old == other.old;
  }

  @override
  int get hashCode => const ListEquality().hash([total, newp, old]);
}

InsightsoverallStruct createInsightsoverallStruct({
  int? total,
  int? newp,
  int? old,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InsightsoverallStruct(
      total: total,
      newp: newp,
      old: old,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InsightsoverallStruct? updateInsightsoverallStruct(
  InsightsoverallStruct? insightsoverall, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    insightsoverall
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInsightsoverallStructData(
  Map<String, dynamic> firestoreData,
  InsightsoverallStruct? insightsoverall,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (insightsoverall == null) {
    return;
  }
  if (insightsoverall.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && insightsoverall.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final insightsoverallData =
      getInsightsoverallFirestoreData(insightsoverall, forFieldValue);
  final nestedData =
      insightsoverallData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = insightsoverall.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInsightsoverallFirestoreData(
  InsightsoverallStruct? insightsoverall, [
  bool forFieldValue = false,
]) {
  if (insightsoverall == null) {
    return {};
  }
  final firestoreData = mapToFirestore(insightsoverall.toMap());

  // Add any Firestore field values
  insightsoverall.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInsightsoverallListFirestoreData(
  List<InsightsoverallStruct>? insightsoveralls,
) =>
    insightsoveralls
        ?.map((e) => getInsightsoverallFirestoreData(e, true))
        .toList() ??
    [];
