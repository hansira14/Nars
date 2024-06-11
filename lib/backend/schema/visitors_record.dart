import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitorsRecord extends FirestoreRecord {
  VisitorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "relation" field.
  String? _relation;
  String get relation => _relation ?? '';
  bool hasRelation() => _relation != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _gender = snapshotData['gender'] as String?;
    _relation = snapshotData['relation'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('visitors')
          : FirebaseFirestore.instance.collectionGroup('visitors');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('visitors').doc(id);

  static Stream<VisitorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitorsRecord.fromSnapshot(s));

  static Future<VisitorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitorsRecord.fromSnapshot(s));

  static VisitorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitorsRecordData({
  String? name,
  int? age,
  String? gender,
  String? relation,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'age': age,
      'gender': gender,
      'relation': relation,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitorsRecordDocumentEquality implements Equality<VisitorsRecord> {
  const VisitorsRecordDocumentEquality();

  @override
  bool equals(VisitorsRecord? e1, VisitorsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.age == e2?.age &&
        e1?.gender == e2?.gender &&
        e1?.relation == e2?.relation &&
        e1?.date == e2?.date;
  }

  @override
  int hash(VisitorsRecord? e) => const ListEquality()
      .hash([e?.name, e?.age, e?.gender, e?.relation, e?.date]);

  @override
  bool isValidKey(Object? o) => o is VisitorsRecord;
}
