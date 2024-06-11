import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InformationRecord extends FirestoreRecord {
  InformationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admissionID" field.
  String? _admissionID;
  String get admissionID => _admissionID ?? '';
  bool hasAdmissionID() => _admissionID != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  bool hasNationality() => _nationality != null;

  // "religion" field.
  String? _religion;
  String get religion => _religion ?? '';
  bool hasReligion() => _religion != null;

  // "civilstatus" field.
  String? _civilstatus;
  String get civilstatus => _civilstatus ?? '';
  bool hasCivilstatus() => _civilstatus != null;

  // "occupation" field.
  String? _occupation;
  String get occupation => _occupation ?? '';
  bool hasOccupation() => _occupation != null;

  // "so_name" field.
  String? _soName;
  String get soName => _soName ?? '';
  bool hasSoName() => _soName != null;

  // "so_relation" field.
  String? _soRelation;
  String get soRelation => _soRelation ?? '';
  bool hasSoRelation() => _soRelation != null;

  // "so_contact" field.
  String? _soContact;
  String get soContact => _soContact ?? '';
  bool hasSoContact() => _soContact != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _admissionID = snapshotData['admissionID'] as String?;
    _contact = snapshotData['contact'] as String?;
    _address = snapshotData['address'] as String?;
    _nationality = snapshotData['nationality'] as String?;
    _religion = snapshotData['religion'] as String?;
    _civilstatus = snapshotData['civilstatus'] as String?;
    _occupation = snapshotData['occupation'] as String?;
    _soName = snapshotData['so_name'] as String?;
    _soRelation = snapshotData['so_relation'] as String?;
    _soContact = snapshotData['so_contact'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('information')
          : FirebaseFirestore.instance.collectionGroup('information');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('information').doc(id);

  static Stream<InformationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InformationRecord.fromSnapshot(s));

  static Future<InformationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InformationRecord.fromSnapshot(s));

  static InformationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InformationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InformationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InformationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InformationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InformationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInformationRecordData({
  String? admissionID,
  String? contact,
  String? address,
  String? nationality,
  String? religion,
  String? civilstatus,
  String? occupation,
  String? soName,
  String? soRelation,
  String? soContact,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admissionID': admissionID,
      'contact': contact,
      'address': address,
      'nationality': nationality,
      'religion': religion,
      'civilstatus': civilstatus,
      'occupation': occupation,
      'so_name': soName,
      'so_relation': soRelation,
      'so_contact': soContact,
    }.withoutNulls,
  );

  return firestoreData;
}

class InformationRecordDocumentEquality implements Equality<InformationRecord> {
  const InformationRecordDocumentEquality();

  @override
  bool equals(InformationRecord? e1, InformationRecord? e2) {
    return e1?.admissionID == e2?.admissionID &&
        e1?.contact == e2?.contact &&
        e1?.address == e2?.address &&
        e1?.nationality == e2?.nationality &&
        e1?.religion == e2?.religion &&
        e1?.civilstatus == e2?.civilstatus &&
        e1?.occupation == e2?.occupation &&
        e1?.soName == e2?.soName &&
        e1?.soRelation == e2?.soRelation &&
        e1?.soContact == e2?.soContact;
  }

  @override
  int hash(InformationRecord? e) => const ListEquality().hash([
        e?.admissionID,
        e?.contact,
        e?.address,
        e?.nationality,
        e?.religion,
        e?.civilstatus,
        e?.occupation,
        e?.soName,
        e?.soRelation,
        e?.soContact
      ]);

  @override
  bool isValidKey(Object? o) => o is InformationRecord;
}
