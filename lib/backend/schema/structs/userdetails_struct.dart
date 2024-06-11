// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserdetailsStruct extends FFFirebaseStruct {
  UserdetailsStruct({
    String? email,
    DocumentReference? userReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _userReference = userReference,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "userReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  set userReference(DocumentReference? val) => _userReference = val;
  bool hasUserReference() => _userReference != null;

  static UserdetailsStruct fromMap(Map<String, dynamic> data) =>
      UserdetailsStruct(
        email: data['email'] as String?,
        userReference: data['userReference'] as DocumentReference?,
      );

  static UserdetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserdetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'userReference': _userReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'userReference': serializeParam(
          _userReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserdetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserdetailsStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        userReference: deserializeParam(
          data['userReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static UserdetailsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserdetailsStruct(
        email: convertAlgoliaParam(
          data['email'],
          ParamType.String,
          false,
        ),
        userReference: convertAlgoliaParam(
          data['userReference'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserdetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserdetailsStruct &&
        email == other.email &&
        userReference == other.userReference;
  }

  @override
  int get hashCode => const ListEquality().hash([email, userReference]);
}

UserdetailsStruct createUserdetailsStruct({
  String? email,
  DocumentReference? userReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserdetailsStruct(
      email: email,
      userReference: userReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserdetailsStruct? updateUserdetailsStruct(
  UserdetailsStruct? userdetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userdetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserdetailsStructData(
  Map<String, dynamic> firestoreData,
  UserdetailsStruct? userdetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userdetails == null) {
    return;
  }
  if (userdetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userdetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userdetailsData =
      getUserdetailsFirestoreData(userdetails, forFieldValue);
  final nestedData =
      userdetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userdetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserdetailsFirestoreData(
  UserdetailsStruct? userdetails, [
  bool forFieldValue = false,
]) {
  if (userdetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userdetails.toMap());

  // Add any Firestore field values
  userdetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserdetailsListFirestoreData(
  List<UserdetailsStruct>? userdetailss,
) =>
    userdetailss?.map((e) => getUserdetailsFirestoreData(e, true)).toList() ??
    [];
