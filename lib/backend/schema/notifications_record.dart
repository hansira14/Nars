import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "recipient" field.
  DocumentReference? _recipient;
  DocumentReference? get recipient => _recipient;
  bool hasRecipient() => _recipient != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "read" field.
  bool? _read;
  bool get read => _read ?? false;
  bool hasRead() => _read != null;

  // "patienref" field.
  DocumentReference? _patienref;
  DocumentReference? get patienref => _patienref;
  bool hasPatienref() => _patienref != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "labref" field.
  DocumentReference? _labref;
  DocumentReference? get labref => _labref;
  bool hasLabref() => _labref != null;

  // "medicineref" field.
  DocumentReference? _medicineref;
  DocumentReference? get medicineref => _medicineref;
  bool hasMedicineref() => _medicineref != null;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _recipient = snapshotData['recipient'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _read = snapshotData['read'] as bool?;
    _patienref = snapshotData['patienref'] as DocumentReference?;
    _type = castToType<int>(snapshotData['type']);
    _labref = snapshotData['labref'] as DocumentReference?;
    _medicineref = snapshotData['medicineref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? sender,
  DocumentReference? recipient,
  String? title,
  String? content,
  DateTime? timestamp,
  bool? read,
  DocumentReference? patienref,
  int? type,
  DocumentReference? labref,
  DocumentReference? medicineref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'recipient': recipient,
      'title': title,
      'content': content,
      'timestamp': timestamp,
      'read': read,
      'patienref': patienref,
      'type': type,
      'labref': labref,
      'medicineref': medicineref,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.recipient == e2?.recipient &&
        e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.timestamp == e2?.timestamp &&
        e1?.read == e2?.read &&
        e1?.patienref == e2?.patienref &&
        e1?.type == e2?.type &&
        e1?.labref == e2?.labref &&
        e1?.medicineref == e2?.medicineref;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.sender,
        e?.recipient,
        e?.title,
        e?.content,
        e?.timestamp,
        e?.read,
        e?.patienref,
        e?.type,
        e?.labref,
        e?.medicineref
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
