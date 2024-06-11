import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IcuRecord extends FirestoreRecord {
  IcuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "patient" field.
  DocumentReference? _patient;
  DocumentReference? get patient => _patient;
  bool hasPatient() => _patient != null;

  // "icu" field.
  String? _icu;
  String get icu => _icu ?? '';
  bool hasIcu() => _icu != null;

  void _initializeFields() {
    _patient = snapshotData['patient'] as DocumentReference?;
    _icu = snapshotData['icu'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ICU');

  static Stream<IcuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IcuRecord.fromSnapshot(s));

  static Future<IcuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IcuRecord.fromSnapshot(s));

  static IcuRecord fromSnapshot(DocumentSnapshot snapshot) => IcuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IcuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IcuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IcuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IcuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIcuRecordData({
  DocumentReference? patient,
  String? icu,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'patient': patient,
      'icu': icu,
    }.withoutNulls,
  );

  return firestoreData;
}

class IcuRecordDocumentEquality implements Equality<IcuRecord> {
  const IcuRecordDocumentEquality();

  @override
  bool equals(IcuRecord? e1, IcuRecord? e2) {
    return e1?.patient == e2?.patient && e1?.icu == e2?.icu;
  }

  @override
  int hash(IcuRecord? e) => const ListEquality().hash([e?.patient, e?.icu]);

  @override
  bool isValidKey(Object? o) => o is IcuRecord;
}
