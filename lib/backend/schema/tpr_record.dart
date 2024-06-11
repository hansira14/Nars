import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TprRecord extends FirestoreRecord {
  TprRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pulse" field.
  int? _pulse;
  int get pulse => _pulse ?? 0;
  bool hasPulse() => _pulse != null;

  // "respiration" field.
  int? _respiration;
  int get respiration => _respiration ?? 0;
  bool hasRespiration() => _respiration != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "temp" field.
  double? _temp;
  double get temp => _temp ?? 0.0;
  bool hasTemp() => _temp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _pulse = castToType<int>(snapshotData['pulse']);
    _respiration = castToType<int>(snapshotData['respiration']);
    _time = snapshotData['time'] as DateTime?;
    _temp = castToType<double>(snapshotData['temp']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tpr')
          : FirebaseFirestore.instance.collectionGroup('tpr');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tpr').doc(id);

  static Stream<TprRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TprRecord.fromSnapshot(s));

  static Future<TprRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TprRecord.fromSnapshot(s));

  static TprRecord fromSnapshot(DocumentSnapshot snapshot) => TprRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TprRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TprRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TprRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TprRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTprRecordData({
  int? pulse,
  int? respiration,
  DateTime? time,
  double? temp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pulse': pulse,
      'respiration': respiration,
      'time': time,
      'temp': temp,
    }.withoutNulls,
  );

  return firestoreData;
}

class TprRecordDocumentEquality implements Equality<TprRecord> {
  const TprRecordDocumentEquality();

  @override
  bool equals(TprRecord? e1, TprRecord? e2) {
    return e1?.pulse == e2?.pulse &&
        e1?.respiration == e2?.respiration &&
        e1?.time == e2?.time &&
        e1?.temp == e2?.temp;
  }

  @override
  int hash(TprRecord? e) =>
      const ListEquality().hash([e?.pulse, e?.respiration, e?.time, e?.temp]);

  @override
  bool isValidKey(Object? o) => o is TprRecord;
}
