import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KardexRecord extends FirestoreRecord {
  KardexRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "isLab" field.
  bool? _isLab;
  bool get isLab => _isLab ?? false;
  bool hasIsLab() => _isLab != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "nurses" field.
  List<DocumentReference>? _nurses;
  List<DocumentReference> get nurses => _nurses ?? const [];
  bool hasNurses() => _nurses != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _note = snapshotData['note'] as String?;
    _isLab = snapshotData['isLab'] as bool?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _nurses = getDataList(snapshotData['nurses']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('kardex')
          : FirebaseFirestore.instance.collectionGroup('kardex');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('kardex').doc(id);

  static Stream<KardexRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KardexRecord.fromSnapshot(s));

  static Future<KardexRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KardexRecord.fromSnapshot(s));

  static KardexRecord fromSnapshot(DocumentSnapshot snapshot) => KardexRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KardexRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KardexRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KardexRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KardexRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKardexRecordData({
  String? note,
  bool? isLab,
  bool? isCompleted,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'note': note,
      'isLab': isLab,
      'isCompleted': isCompleted,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class KardexRecordDocumentEquality implements Equality<KardexRecord> {
  const KardexRecordDocumentEquality();

  @override
  bool equals(KardexRecord? e1, KardexRecord? e2) {
    const listEquality = ListEquality();
    return e1?.note == e2?.note &&
        e1?.isLab == e2?.isLab &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.nurses, e2?.nurses);
  }

  @override
  int hash(KardexRecord? e) => const ListEquality()
      .hash([e?.note, e?.isLab, e?.isCompleted, e?.date, e?.nurses]);

  @override
  bool isValidKey(Object? o) => o is KardexRecord;
}
