import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationsRecord extends FirestoreRecord {
  MedicationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "medicine" field.
  String? _medicine;
  String get medicine => _medicine ?? '';
  bool hasMedicine() => _medicine != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "dose" field.
  int? _dose;
  int get dose => _dose ?? 0;
  bool hasDose() => _dose != null;

  // "frequency" field.
  int? _frequency;
  int get frequency => _frequency ?? 0;
  bool hasFrequency() => _frequency != null;

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  bool hasStart() => _start != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  bool hasEnd() => _end != null;

  // "route" field.
  String? _route;
  String get route => _route ?? '';
  bool hasRoute() => _route != null;

  // "intakes" field.
  List<DateTime>? _intakes;
  List<DateTime> get intakes => _intakes ?? const [];
  bool hasIntakes() => _intakes != null;

  // "nurses" field.
  List<DocumentReference>? _nurses;
  List<DocumentReference> get nurses => _nurses ?? const [];
  bool hasNurses() => _nurses != null;

  // "currentSched" field.
  DateTime? _currentSched;
  DateTime? get currentSched => _currentSched;
  bool hasCurrentSched() => _currentSched != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _medicine = snapshotData['medicine'] as String?;
    _doctor = snapshotData['doctor'] as DocumentReference?;
    _note = snapshotData['note'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _dose = castToType<int>(snapshotData['dose']);
    _frequency = castToType<int>(snapshotData['frequency']);
    _start = snapshotData['start'] as DateTime?;
    _end = snapshotData['end'] as DateTime?;
    _route = snapshotData['route'] as String?;
    _intakes = getDataList(snapshotData['intakes']);
    _nurses = getDataList(snapshotData['nurses']);
    _currentSched = snapshotData['currentSched'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('medications')
          : FirebaseFirestore.instance.collectionGroup('medications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('medications').doc(id);

  static Stream<MedicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationsRecord.fromSnapshot(s));

  static Future<MedicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationsRecord.fromSnapshot(s));

  static MedicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationsRecordData({
  String? medicine,
  DocumentReference? doctor,
  String? note,
  int? duration,
  int? dose,
  int? frequency,
  DateTime? start,
  DateTime? end,
  String? route,
  DateTime? currentSched,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'medicine': medicine,
      'doctor': doctor,
      'note': note,
      'duration': duration,
      'dose': dose,
      'frequency': frequency,
      'start': start,
      'end': end,
      'route': route,
      'currentSched': currentSched,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicationsRecordDocumentEquality implements Equality<MedicationsRecord> {
  const MedicationsRecordDocumentEquality();

  @override
  bool equals(MedicationsRecord? e1, MedicationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.medicine == e2?.medicine &&
        e1?.doctor == e2?.doctor &&
        e1?.note == e2?.note &&
        e1?.duration == e2?.duration &&
        e1?.dose == e2?.dose &&
        e1?.frequency == e2?.frequency &&
        e1?.start == e2?.start &&
        e1?.end == e2?.end &&
        e1?.route == e2?.route &&
        listEquality.equals(e1?.intakes, e2?.intakes) &&
        listEquality.equals(e1?.nurses, e2?.nurses) &&
        e1?.currentSched == e2?.currentSched;
  }

  @override
  int hash(MedicationsRecord? e) => const ListEquality().hash([
        e?.medicine,
        e?.doctor,
        e?.note,
        e?.duration,
        e?.dose,
        e?.frequency,
        e?.start,
        e?.end,
        e?.route,
        e?.intakes,
        e?.nurses,
        e?.currentSched
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicationsRecord;
}
