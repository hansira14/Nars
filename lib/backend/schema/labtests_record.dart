import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LabtestsRecord extends FirestoreRecord {
  LabtestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "document" field.
  String? _document;
  String get document => _document ?? '';
  bool hasDocument() => _document != null;

  // "range" field.
  String? _range;
  String get range => _range ?? '';
  bool hasRange() => _range != null;

  // "fetched" field.
  bool? _fetched;
  bool get fetched => _fetched ?? false;
  bool hasFetched() => _fetched != null;

  // "nurses" field.
  List<DocumentReference>? _nurses;
  List<DocumentReference> get nurses => _nurses ?? const [];
  bool hasNurses() => _nurses != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  bool hasResult() => _result != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _doctor = snapshotData['doctor'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _document = snapshotData['document'] as String?;
    _range = snapshotData['range'] as String?;
    _fetched = snapshotData['fetched'] as bool?;
    _nurses = getDataList(snapshotData['nurses']);
    _result = snapshotData['result'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('labtests')
          : FirebaseFirestore.instance.collectionGroup('labtests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('labtests').doc(id);

  static Stream<LabtestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LabtestsRecord.fromSnapshot(s));

  static Future<LabtestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LabtestsRecord.fromSnapshot(s));

  static LabtestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LabtestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LabtestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LabtestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LabtestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LabtestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLabtestsRecordData({
  String? title,
  DocumentReference? doctor,
  DateTime? date,
  String? document,
  String? range,
  bool? fetched,
  String? result,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'doctor': doctor,
      'date': date,
      'document': document,
      'range': range,
      'fetched': fetched,
      'result': result,
    }.withoutNulls,
  );

  return firestoreData;
}

class LabtestsRecordDocumentEquality implements Equality<LabtestsRecord> {
  const LabtestsRecordDocumentEquality();

  @override
  bool equals(LabtestsRecord? e1, LabtestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.doctor == e2?.doctor &&
        e1?.date == e2?.date &&
        e1?.document == e2?.document &&
        e1?.range == e2?.range &&
        e1?.fetched == e2?.fetched &&
        listEquality.equals(e1?.nurses, e2?.nurses) &&
        e1?.result == e2?.result;
  }

  @override
  int hash(LabtestsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.doctor,
        e?.date,
        e?.document,
        e?.range,
        e?.fetched,
        e?.nurses,
        e?.result
      ]);

  @override
  bool isValidKey(Object? o) => o is LabtestsRecord;
}
