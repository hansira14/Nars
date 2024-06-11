import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TreatmentPlanRecord extends FirestoreRecord {
  TreatmentPlanRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "goals" field.
  List<String>? _goals;
  List<String> get goals => _goals ?? const [];
  bool hasGoals() => _goals != null;

  // "procedure" field.
  List<String>? _procedure;
  List<String> get procedure => _procedure ?? const [];
  bool hasProcedure() => _procedure != null;

  // "lifestyleMod" field.
  List<String>? _lifestyleMod;
  List<String> get lifestyleMod => _lifestyleMod ?? const [];
  bool hasLifestyleMod() => _lifestyleMod != null;

  // "monitoring" field.
  List<String>? _monitoring;
  List<String> get monitoring => _monitoring ?? const [];
  bool hasMonitoring() => _monitoring != null;

  // "instructions" field.
  List<String>? _instructions;
  List<String> get instructions => _instructions ?? const [];
  bool hasInstructions() => _instructions != null;

  // "referrals" field.
  List<String>? _referrals;
  List<String> get referrals => _referrals ?? const [];
  bool hasReferrals() => _referrals != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _goals = getDataList(snapshotData['goals']);
    _procedure = getDataList(snapshotData['procedure']);
    _lifestyleMod = getDataList(snapshotData['lifestyleMod']);
    _monitoring = getDataList(snapshotData['monitoring']);
    _instructions = getDataList(snapshotData['instructions']);
    _referrals = getDataList(snapshotData['referrals']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('treatment_plan')
          : FirebaseFirestore.instance.collectionGroup('treatment_plan');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('treatment_plan').doc(id);

  static Stream<TreatmentPlanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TreatmentPlanRecord.fromSnapshot(s));

  static Future<TreatmentPlanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TreatmentPlanRecord.fromSnapshot(s));

  static TreatmentPlanRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TreatmentPlanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TreatmentPlanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TreatmentPlanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TreatmentPlanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TreatmentPlanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTreatmentPlanRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TreatmentPlanRecordDocumentEquality
    implements Equality<TreatmentPlanRecord> {
  const TreatmentPlanRecordDocumentEquality();

  @override
  bool equals(TreatmentPlanRecord? e1, TreatmentPlanRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.goals, e2?.goals) &&
        listEquality.equals(e1?.procedure, e2?.procedure) &&
        listEquality.equals(e1?.lifestyleMod, e2?.lifestyleMod) &&
        listEquality.equals(e1?.monitoring, e2?.monitoring) &&
        listEquality.equals(e1?.instructions, e2?.instructions) &&
        listEquality.equals(e1?.referrals, e2?.referrals);
  }

  @override
  int hash(TreatmentPlanRecord? e) => const ListEquality().hash([
        e?.goals,
        e?.procedure,
        e?.lifestyleMod,
        e?.monitoring,
        e?.instructions,
        e?.referrals
      ]);

  @override
  bool isValidKey(Object? o) => o is TreatmentPlanRecord;
}
