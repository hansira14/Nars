import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgressNotesRecord extends FirestoreRecord {
  ProgressNotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nurse" field.
  DocumentReference? _nurse;
  DocumentReference? get nurse => _nurse;
  bool hasNurse() => _nurse != null;

  // "notes" field.
  List<String>? _notes;
  List<String> get notes => _notes ?? const [];
  bool hasNotes() => _notes != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nurse = snapshotData['nurse'] as DocumentReference?;
    _notes = getDataList(snapshotData['notes']);
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('progress_notes')
          : FirebaseFirestore.instance.collectionGroup('progress_notes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('progress_notes').doc(id);

  static Stream<ProgressNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgressNotesRecord.fromSnapshot(s));

  static Future<ProgressNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgressNotesRecord.fromSnapshot(s));

  static ProgressNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgressNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgressNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgressNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgressNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgressNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgressNotesRecordData({
  DocumentReference? nurse,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nurse': nurse,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgressNotesRecordDocumentEquality
    implements Equality<ProgressNotesRecord> {
  const ProgressNotesRecordDocumentEquality();

  @override
  bool equals(ProgressNotesRecord? e1, ProgressNotesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nurse == e2?.nurse &&
        listEquality.equals(e1?.notes, e2?.notes) &&
        e1?.date == e2?.date;
  }

  @override
  int hash(ProgressNotesRecord? e) =>
      const ListEquality().hash([e?.nurse, e?.notes, e?.date]);

  @override
  bool isValidKey(Object? o) => o is ProgressNotesRecord;
}
