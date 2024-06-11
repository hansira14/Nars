import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorsNotesRecord extends FirestoreRecord {
  DoctorsNotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notes" field.
  List<String>? _notes;
  List<String> get notes => _notes ?? const [];
  bool hasNotes() => _notes != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _notes = getDataList(snapshotData['notes']);
    _doctor = snapshotData['doctor'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('doctors_notes')
          : FirebaseFirestore.instance.collectionGroup('doctors_notes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('doctors_notes').doc(id);

  static Stream<DoctorsNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorsNotesRecord.fromSnapshot(s));

  static Future<DoctorsNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorsNotesRecord.fromSnapshot(s));

  static DoctorsNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorsNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorsNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorsNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorsNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoctorsNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoctorsNotesRecordData({
  DocumentReference? doctor,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doctor': doctor,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoctorsNotesRecordDocumentEquality
    implements Equality<DoctorsNotesRecord> {
  const DoctorsNotesRecordDocumentEquality();

  @override
  bool equals(DoctorsNotesRecord? e1, DoctorsNotesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.notes, e2?.notes) &&
        e1?.doctor == e2?.doctor &&
        e1?.date == e2?.date;
  }

  @override
  int hash(DoctorsNotesRecord? e) =>
      const ListEquality().hash([e?.notes, e?.doctor, e?.date]);

  @override
  bool isValidKey(Object? o) => o is DoctorsNotesRecord;
}
