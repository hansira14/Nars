import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "accStatus" field.
  int? _accStatus;
  int get accStatus => _accStatus ?? 0;
  bool hasAccStatus() => _accStatus != null;

  // "fname" field.
  String? _fname;
  String get fname => _fname ?? '';
  bool hasFname() => _fname != null;

  // "lname" field.
  String? _lname;
  String get lname => _lname ?? '';
  bool hasLname() => _lname != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "shift" field.
  String? _shift;
  String get shift => _shift ?? '';
  bool hasShift() => _shift != null;

  // "completedSetup" field.
  bool? _completedSetup;
  bool get completedSetup => _completedSetup ?? false;
  bool hasCompletedSetup() => _completedSetup != null;

  // "specialty" field.
  String? _specialty;
  String get specialty => _specialty ?? '';
  bool hasSpecialty() => _specialty != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  // "totalCareLevel" field.
  int? _totalCareLevel;
  int get totalCareLevel => _totalCareLevel ?? 0;
  bool hasTotalCareLevel() => _totalCareLevel != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _accStatus = castToType<int>(snapshotData['accStatus']);
    _fname = snapshotData['fname'] as String?;
    _lname = snapshotData['lname'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _shift = snapshotData['shift'] as String?;
    _completedSetup = snapshotData['completedSetup'] as bool?;
    _specialty = snapshotData['specialty'] as String?;
    _department = snapshotData['department'] as String?;
    _totalCareLevel = castToType<int>(snapshotData['totalCareLevel']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? accStatus,
  String? fname,
  String? lname,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? shift,
  bool? completedSetup,
  String? specialty,
  String? department,
  int? totalCareLevel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'accStatus': accStatus,
      'fname': fname,
      'lname': lname,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'shift': shift,
      'completedSetup': completedSetup,
      'specialty': specialty,
      'department': department,
      'totalCareLevel': totalCareLevel,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.accStatus == e2?.accStatus &&
        e1?.fname == e2?.fname &&
        e1?.lname == e2?.lname &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.shift == e2?.shift &&
        e1?.completedSetup == e2?.completedSetup &&
        e1?.specialty == e2?.specialty &&
        e1?.department == e2?.department &&
        e1?.totalCareLevel == e2?.totalCareLevel;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.accStatus,
        e?.fname,
        e?.lname,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.shift,
        e?.completedSetup,
        e?.specialty,
        e?.department,
        e?.totalCareLevel
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
