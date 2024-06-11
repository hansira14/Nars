import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "surgeries" field.
  List<String>? _surgeries;
  List<String> get surgeries => _surgeries ?? const [];
  bool hasSurgeries() => _surgeries != null;

  // "family_history" field.
  List<String>? _familyHistory;
  List<String> get familyHistory => _familyHistory ?? const [];
  bool hasFamilyHistory() => _familyHistory != null;

  // "social_history" field.
  List<String>? _socialHistory;
  List<String> get socialHistory => _socialHistory ?? const [];
  bool hasSocialHistory() => _socialHistory != null;

  // "past_diagnosis" field.
  List<DiagnosisStruct>? _pastDiagnosis;
  List<DiagnosisStruct> get pastDiagnosis => _pastDiagnosis ?? const [];
  bool hasPastDiagnosis() => _pastDiagnosis != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _surgeries = getDataList(snapshotData['surgeries']);
    _familyHistory = getDataList(snapshotData['family_history']);
    _socialHistory = getDataList(snapshotData['social_history']);
    _pastDiagnosis = getStructList(
      snapshotData['past_diagnosis'],
      DiagnosisStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('history')
          : FirebaseFirestore.instance.collectionGroup('history');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('history').doc(id);

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.surgeries, e2?.surgeries) &&
        listEquality.equals(e1?.familyHistory, e2?.familyHistory) &&
        listEquality.equals(e1?.socialHistory, e2?.socialHistory) &&
        listEquality.equals(e1?.pastDiagnosis, e2?.pastDiagnosis);
  }

  @override
  int hash(HistoryRecord? e) => const ListEquality().hash(
      [e?.surgeries, e?.familyHistory, e?.socialHistory, e?.pastDiagnosis]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
