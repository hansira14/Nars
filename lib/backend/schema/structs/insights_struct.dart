// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsightsStruct extends FFFirebaseStruct {
  InsightsStruct({
    int? medicationcount,
    int? labtestcount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _medicationcount = medicationcount,
        _labtestcount = labtestcount,
        super(firestoreUtilData);

  // "medicationcount" field.
  int? _medicationcount;
  int get medicationcount => _medicationcount ?? 0;
  set medicationcount(int? val) => _medicationcount = val;
  void incrementMedicationcount(int amount) =>
      _medicationcount = medicationcount + amount;
  bool hasMedicationcount() => _medicationcount != null;

  // "labtestcount" field.
  int? _labtestcount;
  int get labtestcount => _labtestcount ?? 0;
  set labtestcount(int? val) => _labtestcount = val;
  void incrementLabtestcount(int amount) =>
      _labtestcount = labtestcount + amount;
  bool hasLabtestcount() => _labtestcount != null;

  static InsightsStruct fromMap(Map<String, dynamic> data) => InsightsStruct(
        medicationcount: castToType<int>(data['medicationcount']),
        labtestcount: castToType<int>(data['labtestcount']),
      );

  static InsightsStruct? maybeFromMap(dynamic data) =>
      data is Map ? InsightsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'medicationcount': _medicationcount,
        'labtestcount': _labtestcount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medicationcount': serializeParam(
          _medicationcount,
          ParamType.int,
        ),
        'labtestcount': serializeParam(
          _labtestcount,
          ParamType.int,
        ),
      }.withoutNulls;

  static InsightsStruct fromSerializableMap(Map<String, dynamic> data) =>
      InsightsStruct(
        medicationcount: deserializeParam(
          data['medicationcount'],
          ParamType.int,
          false,
        ),
        labtestcount: deserializeParam(
          data['labtestcount'],
          ParamType.int,
          false,
        ),
      );

  static InsightsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      InsightsStruct(
        medicationcount: convertAlgoliaParam(
          data['medicationcount'],
          ParamType.int,
          false,
        ),
        labtestcount: convertAlgoliaParam(
          data['labtestcount'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'InsightsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InsightsStruct &&
        medicationcount == other.medicationcount &&
        labtestcount == other.labtestcount;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([medicationcount, labtestcount]);
}

InsightsStruct createInsightsStruct({
  int? medicationcount,
  int? labtestcount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InsightsStruct(
      medicationcount: medicationcount,
      labtestcount: labtestcount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InsightsStruct? updateInsightsStruct(
  InsightsStruct? insights, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    insights
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInsightsStructData(
  Map<String, dynamic> firestoreData,
  InsightsStruct? insights,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (insights == null) {
    return;
  }
  if (insights.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && insights.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final insightsData = getInsightsFirestoreData(insights, forFieldValue);
  final nestedData = insightsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = insights.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInsightsFirestoreData(
  InsightsStruct? insights, [
  bool forFieldValue = false,
]) {
  if (insights == null) {
    return {};
  }
  final firestoreData = mapToFirestore(insights.toMap());

  // Add any Firestore field values
  insights.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInsightsListFirestoreData(
  List<InsightsStruct>? insightss,
) =>
    insightss?.map((e) => getInsightsFirestoreData(e, true)).toList() ?? [];
