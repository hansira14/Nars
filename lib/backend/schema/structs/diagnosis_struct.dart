// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiagnosisStruct extends FFFirebaseStruct {
  DiagnosisStruct({
    String? name,
    DateTime? date,
    DocumentReference? diagnosedBy,
    DateTime? end,
    bool? isActive,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _date = date,
        _diagnosedBy = diagnosedBy,
        _end = end,
        _isActive = isActive,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "diagnosedBy" field.
  DocumentReference? _diagnosedBy;
  DocumentReference? get diagnosedBy => _diagnosedBy;
  set diagnosedBy(DocumentReference? val) => _diagnosedBy = val;
  bool hasDiagnosedBy() => _diagnosedBy != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  set end(DateTime? val) => _end = val;
  bool hasEnd() => _end != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  set isActive(bool? val) => _isActive = val;
  bool hasIsActive() => _isActive != null;

  static DiagnosisStruct fromMap(Map<String, dynamic> data) => DiagnosisStruct(
        name: data['name'] as String?,
        date: data['date'] as DateTime?,
        diagnosedBy: data['diagnosedBy'] as DocumentReference?,
        end: data['end'] as DateTime?,
        isActive: data['isActive'] as bool?,
      );

  static DiagnosisStruct? maybeFromMap(dynamic data) => data is Map
      ? DiagnosisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'date': _date,
        'diagnosedBy': _diagnosedBy,
        'end': _end,
        'isActive': _isActive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'diagnosedBy': serializeParam(
          _diagnosedBy,
          ParamType.DocumentReference,
        ),
        'end': serializeParam(
          _end,
          ParamType.DateTime,
        ),
        'isActive': serializeParam(
          _isActive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DiagnosisStruct fromSerializableMap(Map<String, dynamic> data) =>
      DiagnosisStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        diagnosedBy: deserializeParam(
          data['diagnosedBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        end: deserializeParam(
          data['end'],
          ParamType.DateTime,
          false,
        ),
        isActive: deserializeParam(
          data['isActive'],
          ParamType.bool,
          false,
        ),
      );

  static DiagnosisStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DiagnosisStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        diagnosedBy: convertAlgoliaParam(
          data['diagnosedBy'],
          ParamType.DocumentReference,
          false,
        ),
        end: convertAlgoliaParam(
          data['end'],
          ParamType.DateTime,
          false,
        ),
        isActive: convertAlgoliaParam(
          data['isActive'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DiagnosisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DiagnosisStruct &&
        name == other.name &&
        date == other.date &&
        diagnosedBy == other.diagnosedBy &&
        end == other.end &&
        isActive == other.isActive;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, date, diagnosedBy, end, isActive]);
}

DiagnosisStruct createDiagnosisStruct({
  String? name,
  DateTime? date,
  DocumentReference? diagnosedBy,
  DateTime? end,
  bool? isActive,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DiagnosisStruct(
      name: name,
      date: date,
      diagnosedBy: diagnosedBy,
      end: end,
      isActive: isActive,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DiagnosisStruct? updateDiagnosisStruct(
  DiagnosisStruct? diagnosis, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    diagnosis
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDiagnosisStructData(
  Map<String, dynamic> firestoreData,
  DiagnosisStruct? diagnosis,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (diagnosis == null) {
    return;
  }
  if (diagnosis.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && diagnosis.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final diagnosisData = getDiagnosisFirestoreData(diagnosis, forFieldValue);
  final nestedData = diagnosisData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = diagnosis.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDiagnosisFirestoreData(
  DiagnosisStruct? diagnosis, [
  bool forFieldValue = false,
]) {
  if (diagnosis == null) {
    return {};
  }
  final firestoreData = mapToFirestore(diagnosis.toMap());

  // Add any Firestore field values
  diagnosis.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDiagnosisListFirestoreData(
  List<DiagnosisStruct>? diagnosiss,
) =>
    diagnosiss?.map((e) => getDiagnosisFirestoreData(e, true)).toList() ?? [];
