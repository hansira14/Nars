import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WardsRecord extends FirestoreRecord {
  WardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "patientcount" field.
  int? _patientcount;
  int get patientcount => _patientcount ?? 0;
  bool hasPatientcount() => _patientcount != null;

  // "ward" field.
  String? _ward;
  String get ward => _ward ?? '';
  bool hasWard() => _ward != null;

  void _initializeFields() {
    _capacity = castToType<int>(snapshotData['capacity']);
    _patientcount = castToType<int>(snapshotData['patientcount']);
    _ward = snapshotData['ward'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wards');

  static Stream<WardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WardsRecord.fromSnapshot(s));

  static Future<WardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WardsRecord.fromSnapshot(s));

  static WardsRecord fromSnapshot(DocumentSnapshot snapshot) => WardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWardsRecordData({
  int? capacity,
  int? patientcount,
  String? ward,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'capacity': capacity,
      'patientcount': patientcount,
      'ward': ward,
    }.withoutNulls,
  );

  return firestoreData;
}

class WardsRecordDocumentEquality implements Equality<WardsRecord> {
  const WardsRecordDocumentEquality();

  @override
  bool equals(WardsRecord? e1, WardsRecord? e2) {
    return e1?.capacity == e2?.capacity &&
        e1?.patientcount == e2?.patientcount &&
        e1?.ward == e2?.ward;
  }

  @override
  int hash(WardsRecord? e) =>
      const ListEquality().hash([e?.capacity, e?.patientcount, e?.ward]);

  @override
  bool isValidKey(Object? o) => o is WardsRecord;
}
