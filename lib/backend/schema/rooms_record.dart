import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomsRecord extends FirestoreRecord {
  RoomsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "patient" field.
  DocumentReference? _patient;
  DocumentReference? get patient => _patient;
  bool hasPatient() => _patient != null;

  // "room" field.
  String? _room;
  String get room => _room ?? '';
  bool hasRoom() => _room != null;

  void _initializeFields() {
    _patient = snapshotData['patient'] as DocumentReference?;
    _room = snapshotData['room'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rooms');

  static Stream<RoomsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomsRecord.fromSnapshot(s));

  static Future<RoomsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomsRecord.fromSnapshot(s));

  static RoomsRecord fromSnapshot(DocumentSnapshot snapshot) => RoomsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoomsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoomsRecordData({
  DocumentReference? patient,
  String? room,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'patient': patient,
      'room': room,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoomsRecordDocumentEquality implements Equality<RoomsRecord> {
  const RoomsRecordDocumentEquality();

  @override
  bool equals(RoomsRecord? e1, RoomsRecord? e2) {
    return e1?.patient == e2?.patient && e1?.room == e2?.room;
  }

  @override
  int hash(RoomsRecord? e) => const ListEquality().hash([e?.patient, e?.room]);

  @override
  bool isValidKey(Object? o) => o is RoomsRecord;
}
