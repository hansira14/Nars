import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InoutRecord extends FirestoreRecord {
  InoutRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "intakes" field.
  List<IntakeStruct>? _intakes;
  List<IntakeStruct> get intakes => _intakes ?? const [];
  bool hasIntakes() => _intakes != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _intakes = getStructList(
      snapshotData['intakes'],
      IntakeStruct.fromMap,
    );
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('inout')
          : FirebaseFirestore.instance.collectionGroup('inout');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('inout').doc(id);

  static Stream<InoutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InoutRecord.fromSnapshot(s));

  static Future<InoutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InoutRecord.fromSnapshot(s));

  static InoutRecord fromSnapshot(DocumentSnapshot snapshot) => InoutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InoutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InoutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InoutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InoutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInoutRecordData({
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class InoutRecordDocumentEquality implements Equality<InoutRecord> {
  const InoutRecordDocumentEquality();

  @override
  bool equals(InoutRecord? e1, InoutRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.intakes, e2?.intakes) &&
        e1?.date == e2?.date;
  }

  @override
  int hash(InoutRecord? e) => const ListEquality().hash([e?.intakes, e?.date]);

  @override
  bool isValidKey(Object? o) => o is InoutRecord;
}
