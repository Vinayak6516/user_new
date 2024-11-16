import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "MorD" field.
  String? _morD;
  String get morD => _morD ?? '';
  bool hasMorD() => _morD != null;

  // "acct_num" field.
  int? _acctNum;
  int get acctNum => _acctNum ?? 0;
  bool hasAcctNum() => _acctNum != null;

  // "cur_bal" field.
  int? _curBal;
  int get curBal => _curBal ?? 0;
  bool hasCurBal() => _curBal != null;

  // "auction_no" field.
  int? _auctionNo;
  int get auctionNo => _auctionNo ?? 0;
  bool hasAuctionNo() => _auctionNo != null;

  // "installmentAmt" field.
  int? _installmentAmt;
  int get installmentAmt => _installmentAmt ?? 0;
  bool hasInstallmentAmt() => _installmentAmt != null;

  // "balAmt" field.
  int? _balAmt;
  int get balAmt => _balAmt ?? 0;
  bool hasBalAmt() => _balAmt != null;

  // "collected_amt" field.
  int? _collectedAmt;
  int get collectedAmt => _collectedAmt ?? 0;
  bool hasCollectedAmt() => _collectedAmt != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "auctionDate" field.
  String? _auctionDate;
  String get auctionDate => _auctionDate ?? '';
  bool hasAuctionDate() => _auctionDate != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _morD = snapshotData['MorD'] as String?;
    _acctNum = castToType<int>(snapshotData['acct_num']);
    _curBal = castToType<int>(snapshotData['cur_bal']);
    _auctionNo = castToType<int>(snapshotData['auction_no']);
    _installmentAmt = castToType<int>(snapshotData['installmentAmt']);
    _balAmt = castToType<int>(snapshotData['balAmt']);
    _collectedAmt = castToType<int>(snapshotData['collected_amt']);
    _uid = snapshotData['uid'] as String?;
    _phone = snapshotData['phone'] as String?;
    _company = snapshotData['company'] as String?;
    _auctionDate = snapshotData['auctionDate'] as String?;
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
  String? displayName,
  String? morD,
  int? acctNum,
  int? curBal,
  int? auctionNo,
  int? installmentAmt,
  int? balAmt,
  int? collectedAmt,
  String? uid,
  String? phone,
  String? company,
  String? auctionDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'MorD': morD,
      'acct_num': acctNum,
      'cur_bal': curBal,
      'auction_no': auctionNo,
      'installmentAmt': installmentAmt,
      'balAmt': balAmt,
      'collected_amt': collectedAmt,
      'uid': uid,
      'phone': phone,
      'company': company,
      'auctionDate': auctionDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.morD == e2?.morD &&
        e1?.acctNum == e2?.acctNum &&
        e1?.curBal == e2?.curBal &&
        e1?.auctionNo == e2?.auctionNo &&
        e1?.installmentAmt == e2?.installmentAmt &&
        e1?.balAmt == e2?.balAmt &&
        e1?.collectedAmt == e2?.collectedAmt &&
        e1?.uid == e2?.uid &&
        e1?.phone == e2?.phone &&
        e1?.company == e2?.company &&
        e1?.auctionDate == e2?.auctionDate;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.morD,
        e?.acctNum,
        e?.curBal,
        e?.auctionNo,
        e?.installmentAmt,
        e?.balAmt,
        e?.collectedAmt,
        e?.uid,
        e?.phone,
        e?.company,
        e?.auctionDate
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
