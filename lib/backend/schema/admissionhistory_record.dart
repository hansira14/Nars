import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdmissionhistoryRecord extends FirestoreRecord {
  AdmissionhistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admittedon" field.
  DateTime? _admittedon;
  DateTime? get admittedon => _admittedon;
  bool hasAdmittedon() => _admittedon != null;

  // "discharged" field.
  DateTime? _discharged;
  DateTime? get discharged => _discharged;
  bool hasDischarged() => _discharged != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _admittedon = snapshotData['admittedon'] as DateTime?;
    _discharged = snapshotData['discharged'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('admissionhistory')
          : FirebaseFirestore.instance.collectionGroup('admissionhistory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('admissionhistory').doc(id);

  static Stream<AdmissionhistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdmissionhistoryRecord.fromSnapshot(s));

  static Future<AdmissionhistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdmissionhistoryRecord.fromSnapshot(s));

  static AdmissionhistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdmissionhistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdmissionhistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdmissionhistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdmissionhistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdmissionhistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdmissionhistoryRecordData({
  DateTime? admittedon,
  DateTime? discharged,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admittedon': admittedon,
      'discharged': discharged,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdmissionhistoryRecordDocumentEquality
    implements Equality<AdmissionhistoryRecord> {
  const AdmissionhistoryRecordDocumentEquality();

  @override
  bool equals(AdmissionhistoryRecord? e1, AdmissionhistoryRecord? e2) {
    return e1?.admittedon == e2?.admittedon && e1?.discharged == e2?.discharged;
  }

  @override
  int hash(AdmissionhistoryRecord? e) =>
      const ListEquality().hash([e?.admittedon, e?.discharged]);

  @override
  bool isValidKey(Object? o) => o is AdmissionhistoryRecord;
}
