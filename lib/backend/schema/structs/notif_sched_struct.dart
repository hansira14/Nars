// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotifSchedStruct extends FFFirebaseStruct {
  NotifSchedStruct({
    DateTime? time,
    DocumentReference? recipient,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _recipient = recipient,
        super(firestoreUtilData);

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;
  bool hasTime() => _time != null;

  // "recipient" field.
  DocumentReference? _recipient;
  DocumentReference? get recipient => _recipient;
  set recipient(DocumentReference? val) => _recipient = val;
  bool hasRecipient() => _recipient != null;

  static NotifSchedStruct fromMap(Map<String, dynamic> data) =>
      NotifSchedStruct(
        time: data['time'] as DateTime?,
        recipient: data['recipient'] as DocumentReference?,
      );

  static NotifSchedStruct? maybeFromMap(dynamic data) => data is Map
      ? NotifSchedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'recipient': _recipient,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'recipient': serializeParam(
          _recipient,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static NotifSchedStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotifSchedStruct(
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        recipient: deserializeParam(
          data['recipient'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static NotifSchedStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NotifSchedStruct(
        time: convertAlgoliaParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        recipient: convertAlgoliaParam(
          data['recipient'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NotifSchedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotifSchedStruct &&
        time == other.time &&
        recipient == other.recipient;
  }

  @override
  int get hashCode => const ListEquality().hash([time, recipient]);
}

NotifSchedStruct createNotifSchedStruct({
  DateTime? time,
  DocumentReference? recipient,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotifSchedStruct(
      time: time,
      recipient: recipient,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotifSchedStruct? updateNotifSchedStruct(
  NotifSchedStruct? notifSched, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notifSched
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotifSchedStructData(
  Map<String, dynamic> firestoreData,
  NotifSchedStruct? notifSched,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notifSched == null) {
    return;
  }
  if (notifSched.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notifSched.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notifSchedData = getNotifSchedFirestoreData(notifSched, forFieldValue);
  final nestedData = notifSchedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notifSched.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotifSchedFirestoreData(
  NotifSchedStruct? notifSched, [
  bool forFieldValue = false,
]) {
  if (notifSched == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notifSched.toMap());

  // Add any Firestore field values
  notifSched.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotifSchedListFirestoreData(
  List<NotifSchedStruct>? notifScheds,
) =>
    notifScheds?.map((e) => getNotifSchedFirestoreData(e, true)).toList() ?? [];
