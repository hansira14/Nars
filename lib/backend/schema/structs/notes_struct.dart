// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesStruct extends FFFirebaseStruct {
  NotesStruct({
    String? note,
    bool? isLab,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _note = note,
        _isLab = isLab,
        super(firestoreUtilData);

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;
  bool hasNote() => _note != null;

  // "isLab" field.
  bool? _isLab;
  bool get isLab => _isLab ?? false;
  set isLab(bool? val) => _isLab = val;
  bool hasIsLab() => _isLab != null;

  static NotesStruct fromMap(Map<String, dynamic> data) => NotesStruct(
        note: data['note'] as String?,
        isLab: data['isLab'] as bool?,
      );

  static NotesStruct? maybeFromMap(dynamic data) =>
      data is Map ? NotesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'note': _note,
        'isLab': _isLab,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'isLab': serializeParam(
          _isLab,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NotesStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotesStruct(
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        isLab: deserializeParam(
          data['isLab'],
          ParamType.bool,
          false,
        ),
      );

  static NotesStruct fromAlgoliaData(Map<String, dynamic> data) => NotesStruct(
        note: convertAlgoliaParam(
          data['note'],
          ParamType.String,
          false,
        ),
        isLab: convertAlgoliaParam(
          data['isLab'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NotesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotesStruct && note == other.note && isLab == other.isLab;
  }

  @override
  int get hashCode => const ListEquality().hash([note, isLab]);
}

NotesStruct createNotesStruct({
  String? note,
  bool? isLab,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotesStruct(
      note: note,
      isLab: isLab,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotesStruct? updateNotesStruct(
  NotesStruct? notes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotesStructData(
  Map<String, dynamic> firestoreData,
  NotesStruct? notes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notes == null) {
    return;
  }
  if (notes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notesData = getNotesFirestoreData(notes, forFieldValue);
  final nestedData = notesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotesFirestoreData(
  NotesStruct? notes, [
  bool forFieldValue = false,
]) {
  if (notes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notes.toMap());

  // Add any Firestore field values
  notes.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotesListFirestoreData(
  List<NotesStruct>? notess,
) =>
    notess?.map((e) => getNotesFirestoreData(e, true)).toList() ?? [];
