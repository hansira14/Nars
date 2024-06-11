// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipientStruct extends FFFirebaseStruct {
  RecipientStruct({
    List<DocumentReference>? recipients,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _recipients = recipients,
        super(firestoreUtilData);

  // "recipients" field.
  List<DocumentReference>? _recipients;
  List<DocumentReference> get recipients => _recipients ?? const [];
  set recipients(List<DocumentReference>? val) => _recipients = val;
  void updateRecipients(Function(List<DocumentReference>) updateFn) =>
      updateFn(_recipients ??= []);
  bool hasRecipients() => _recipients != null;

  static RecipientStruct fromMap(Map<String, dynamic> data) => RecipientStruct(
        recipients: getDataList(data['recipients']),
      );

  static RecipientStruct? maybeFromMap(dynamic data) => data is Map
      ? RecipientStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'recipients': _recipients,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'recipients': serializeParam(
          _recipients,
          ParamType.DocumentReference,
          true,
        ),
      }.withoutNulls;

  static RecipientStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecipientStruct(
        recipients: deserializeParam<DocumentReference>(
          data['recipients'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
      );

  static RecipientStruct fromAlgoliaData(Map<String, dynamic> data) =>
      RecipientStruct(
        recipients: convertAlgoliaParam<DocumentReference>(
          data['recipients'],
          ParamType.DocumentReference,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RecipientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RecipientStruct &&
        listEquality.equals(recipients, other.recipients);
  }

  @override
  int get hashCode => const ListEquality().hash([recipients]);
}

RecipientStruct createRecipientStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecipientStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecipientStruct? updateRecipientStruct(
  RecipientStruct? recipient, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recipient
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecipientStructData(
  Map<String, dynamic> firestoreData,
  RecipientStruct? recipient,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recipient == null) {
    return;
  }
  if (recipient.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recipient.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recipientData = getRecipientFirestoreData(recipient, forFieldValue);
  final nestedData = recipientData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recipient.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecipientFirestoreData(
  RecipientStruct? recipient, [
  bool forFieldValue = false,
]) {
  if (recipient == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recipient.toMap());

  // Add any Firestore field values
  recipient.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecipientListFirestoreData(
  List<RecipientStruct>? recipients,
) =>
    recipients?.map((e) => getRecipientFirestoreData(e, true)).toList() ?? [];
