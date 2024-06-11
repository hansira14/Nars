import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PatientRecord extends FirestoreRecord {
  PatientRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fname" field.
  String? _fname;
  String get fname => _fname ?? '';
  bool hasFname() => _fname != null;

  // "lname" field.
  String? _lname;
  String get lname => _lname ?? '';
  bool hasLname() => _lname != null;

  // "mname" field.
  String? _mname;
  String get mname => _mname ?? '';
  bool hasMname() => _mname != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "blood" field.
  String? _blood;
  String get blood => _blood ?? '';
  bool hasBlood() => _blood != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "allergies" field.
  List<String>? _allergies;
  List<String> get allergies => _allergies ?? const [];
  bool hasAllergies() => _allergies != null;

  // "intolerance" field.
  List<String>? _intolerance;
  List<String> get intolerance => _intolerance ?? const [];
  bool hasIntolerance() => _intolerance != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  // "carelevel" field.
  int? _carelevel;
  int get carelevel => _carelevel ?? 0;
  bool hasCarelevel() => _carelevel != null;

  // "nurse1" field.
  DocumentReference? _nurse1;
  DocumentReference? get nurse1 => _nurse1;
  bool hasNurse1() => _nurse1 != null;

  // "nurse2" field.
  DocumentReference? _nurse2;
  DocumentReference? get nurse2 => _nurse2;
  bool hasNurse2() => _nurse2 != null;

  // "nurse3" field.
  DocumentReference? _nurse3;
  DocumentReference? get nurse3 => _nurse3;
  bool hasNurse3() => _nurse3 != null;

  // "admissionDate" field.
  DateTime? _admissionDate;
  DateTime? get admissionDate => _admissionDate;
  bool hasAdmissionDate() => _admissionDate != null;

  // "dischargeDate" field.
  DateTime? _dischargeDate;
  DateTime? get dischargeDate => _dischargeDate;
  bool hasDischargeDate() => _dischargeDate != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "discharged" field.
  bool? _discharged;
  bool get discharged => _discharged ?? false;
  bool hasDischarged() => _discharged != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  // "kardexcount" field.
  int? _kardexcount;
  int get kardexcount => _kardexcount ?? 0;
  bool hasKardexcount() => _kardexcount != null;

  // "diagnoses" field.
  List<String>? _diagnoses;
  List<String> get diagnoses => _diagnoses ?? const [];
  bool hasDiagnoses() => _diagnoses != null;

  // "wardroom" field.
  String? _wardroom;
  String get wardroom => _wardroom ?? '';
  bool hasWardroom() => _wardroom != null;

  void _initializeFields() {
    _fname = snapshotData['fname'] as String?;
    _lname = snapshotData['lname'] as String?;
    _mname = snapshotData['mname'] as String?;
    _dob = snapshotData['dob'] as DateTime?;
    _gender = snapshotData['gender'] as String?;
    _blood = snapshotData['blood'] as String?;
    _height = castToType<double>(snapshotData['height']);
    _weight = castToType<double>(snapshotData['weight']);
    _allergies = getDataList(snapshotData['allergies']);
    _intolerance = getDataList(snapshotData['intolerance']);
    _doctor = snapshotData['doctor'] as DocumentReference?;
    _carelevel = castToType<int>(snapshotData['carelevel']);
    _nurse1 = snapshotData['nurse1'] as DocumentReference?;
    _nurse2 = snapshotData['nurse2'] as DocumentReference?;
    _nurse3 = snapshotData['nurse3'] as DocumentReference?;
    _admissionDate = snapshotData['admissionDate'] as DateTime?;
    _dischargeDate = snapshotData['dischargeDate'] as DateTime?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _discharged = snapshotData['discharged'] as bool?;
    _department = snapshotData['department'] as String?;
    _kardexcount = castToType<int>(snapshotData['kardexcount']);
    _diagnoses = getDataList(snapshotData['diagnoses']);
    _wardroom = snapshotData['wardroom'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('patient');

  static Stream<PatientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PatientRecord.fromSnapshot(s));

  static Future<PatientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PatientRecord.fromSnapshot(s));

  static PatientRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PatientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PatientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PatientRecord._(reference, mapFromFirestore(data));

  static PatientRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PatientRecord.getDocumentFromData(
        {
          'fname': snapshot.data['fname'],
          'lname': snapshot.data['lname'],
          'mname': snapshot.data['mname'],
          'dob': convertAlgoliaParam(
            snapshot.data['dob'],
            ParamType.DateTime,
            false,
          ),
          'gender': snapshot.data['gender'],
          'blood': snapshot.data['blood'],
          'height': convertAlgoliaParam(
            snapshot.data['height'],
            ParamType.double,
            false,
          ),
          'weight': convertAlgoliaParam(
            snapshot.data['weight'],
            ParamType.double,
            false,
          ),
          'allergies': safeGet(
            () => snapshot.data['allergies'].toList(),
          ),
          'intolerance': safeGet(
            () => snapshot.data['intolerance'].toList(),
          ),
          'doctor': convertAlgoliaParam(
            snapshot.data['doctor'],
            ParamType.DocumentReference,
            false,
          ),
          'carelevel': convertAlgoliaParam(
            snapshot.data['carelevel'],
            ParamType.int,
            false,
          ),
          'nurse1': convertAlgoliaParam(
            snapshot.data['nurse1'],
            ParamType.DocumentReference,
            false,
          ),
          'nurse2': convertAlgoliaParam(
            snapshot.data['nurse2'],
            ParamType.DocumentReference,
            false,
          ),
          'nurse3': convertAlgoliaParam(
            snapshot.data['nurse3'],
            ParamType.DocumentReference,
            false,
          ),
          'admissionDate': convertAlgoliaParam(
            snapshot.data['admissionDate'],
            ParamType.DateTime,
            false,
          ),
          'dischargeDate': convertAlgoliaParam(
            snapshot.data['dischargeDate'],
            ParamType.DateTime,
            false,
          ),
          'userID': convertAlgoliaParam(
            snapshot.data['userID'],
            ParamType.DocumentReference,
            false,
          ),
          'discharged': snapshot.data['discharged'],
          'department': snapshot.data['department'],
          'kardexcount': convertAlgoliaParam(
            snapshot.data['kardexcount'],
            ParamType.int,
            false,
          ),
          'diagnoses': safeGet(
            () => snapshot.data['diagnoses'].toList(),
          ),
          'wardroom': snapshot.data['wardroom'],
        },
        PatientRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PatientRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'patient',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PatientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PatientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPatientRecordData({
  String? fname,
  String? lname,
  String? mname,
  DateTime? dob,
  String? gender,
  String? blood,
  double? height,
  double? weight,
  DocumentReference? doctor,
  int? carelevel,
  DocumentReference? nurse1,
  DocumentReference? nurse2,
  DocumentReference? nurse3,
  DateTime? admissionDate,
  DateTime? dischargeDate,
  DocumentReference? userID,
  bool? discharged,
  String? department,
  int? kardexcount,
  String? wardroom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fname': fname,
      'lname': lname,
      'mname': mname,
      'dob': dob,
      'gender': gender,
      'blood': blood,
      'height': height,
      'weight': weight,
      'doctor': doctor,
      'carelevel': carelevel,
      'nurse1': nurse1,
      'nurse2': nurse2,
      'nurse3': nurse3,
      'admissionDate': admissionDate,
      'dischargeDate': dischargeDate,
      'userID': userID,
      'discharged': discharged,
      'department': department,
      'kardexcount': kardexcount,
      'wardroom': wardroom,
    }.withoutNulls,
  );

  return firestoreData;
}

class PatientRecordDocumentEquality implements Equality<PatientRecord> {
  const PatientRecordDocumentEquality();

  @override
  bool equals(PatientRecord? e1, PatientRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fname == e2?.fname &&
        e1?.lname == e2?.lname &&
        e1?.mname == e2?.mname &&
        e1?.dob == e2?.dob &&
        e1?.gender == e2?.gender &&
        e1?.blood == e2?.blood &&
        e1?.height == e2?.height &&
        e1?.weight == e2?.weight &&
        listEquality.equals(e1?.allergies, e2?.allergies) &&
        listEquality.equals(e1?.intolerance, e2?.intolerance) &&
        e1?.doctor == e2?.doctor &&
        e1?.carelevel == e2?.carelevel &&
        e1?.nurse1 == e2?.nurse1 &&
        e1?.nurse2 == e2?.nurse2 &&
        e1?.nurse3 == e2?.nurse3 &&
        e1?.admissionDate == e2?.admissionDate &&
        e1?.dischargeDate == e2?.dischargeDate &&
        e1?.userID == e2?.userID &&
        e1?.discharged == e2?.discharged &&
        e1?.department == e2?.department &&
        e1?.kardexcount == e2?.kardexcount &&
        listEquality.equals(e1?.diagnoses, e2?.diagnoses) &&
        e1?.wardroom == e2?.wardroom;
  }

  @override
  int hash(PatientRecord? e) => const ListEquality().hash([
        e?.fname,
        e?.lname,
        e?.mname,
        e?.dob,
        e?.gender,
        e?.blood,
        e?.height,
        e?.weight,
        e?.allergies,
        e?.intolerance,
        e?.doctor,
        e?.carelevel,
        e?.nurse1,
        e?.nurse2,
        e?.nurse3,
        e?.admissionDate,
        e?.dischargeDate,
        e?.userID,
        e?.discharged,
        e?.department,
        e?.kardexcount,
        e?.diagnoses,
        e?.wardroom
      ]);

  @override
  bool isValidKey(Object? o) => o is PatientRecord;
}
