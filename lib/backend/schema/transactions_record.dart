import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "collectedAmt" field.
  int? _collectedAmt;
  int get collectedAmt => _collectedAmt ?? 0;
  bool hasCollectedAmt() => _collectedAmt != null;

  // "installmentNum" field.
  int? _installmentNum;
  int get installmentNum => _installmentNum ?? 0;
  bool hasInstallmentNum() => _installmentNum != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "acctNum" field.
  int? _acctNum;
  int get acctNum => _acctNum ?? 0;
  bool hasAcctNum() => _acctNum != null;

  // "paymentType" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  bool hasPaymentType() => _paymentType != null;

  // "recieptNo" field.
  String? _recieptNo;
  String get recieptNo => _recieptNo ?? '';
  bool hasRecieptNo() => _recieptNo != null;

  // "Incentive" field.
  List<int>? _incentive;
  List<int> get incentive => _incentive ?? const [];
  bool hasIncentive() => _incentive != null;

  // "penalty" field.
  List<int>? _penalty;
  List<int> get penalty => _penalty ?? const [];
  bool hasPenalty() => _penalty != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "chequeDate" field.
  DateTime? _chequeDate;
  DateTime? get chequeDate => _chequeDate;
  bool hasChequeDate() => _chequeDate != null;

  // "chequeNo" field.
  String? _chequeNo;
  String get chequeNo => _chequeNo ?? '';
  bool hasChequeNo() => _chequeNo != null;

  // "subBank" field.
  String? _subBank;
  String get subBank => _subBank ?? '';
  bool hasSubBank() => _subBank != null;

  // "subName" field.
  String? _subName;
  String get subName => _subName ?? '';
  bool hasSubName() => _subName != null;

  // "MorD" field.
  String? _morD;
  String get morD => _morD ?? '';
  bool hasMorD() => _morD != null;

  void _initializeFields() {
    _collectedAmt = castToType<int>(snapshotData['collectedAmt']);
    _installmentNum = castToType<int>(snapshotData['installmentNum']);
    _dateTime = snapshotData['dateTime'] as DateTime?;
    _acctNum = castToType<int>(snapshotData['acctNum']);
    _paymentType = snapshotData['paymentType'] as String?;
    _recieptNo = snapshotData['recieptNo'] as String?;
    _incentive = getDataList(snapshotData['Incentive']);
    _penalty = getDataList(snapshotData['penalty']);
    _uid = snapshotData['uid'] as String?;
    _company = snapshotData['company'] as String?;
    _chequeDate = snapshotData['chequeDate'] as DateTime?;
    _chequeNo = snapshotData['chequeNo'] as String?;
    _subBank = snapshotData['subBank'] as String?;
    _subName = snapshotData['subName'] as String?;
    _morD = snapshotData['MorD'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  int? collectedAmt,
  int? installmentNum,
  DateTime? dateTime,
  int? acctNum,
  String? paymentType,
  String? recieptNo,
  String? uid,
  String? company,
  DateTime? chequeDate,
  String? chequeNo,
  String? subBank,
  String? subName,
  String? morD,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'collectedAmt': collectedAmt,
      'installmentNum': installmentNum,
      'dateTime': dateTime,
      'acctNum': acctNum,
      'paymentType': paymentType,
      'recieptNo': recieptNo,
      'uid': uid,
      'company': company,
      'chequeDate': chequeDate,
      'chequeNo': chequeNo,
      'subBank': subBank,
      'subName': subName,
      'MorD': morD,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.collectedAmt == e2?.collectedAmt &&
        e1?.installmentNum == e2?.installmentNum &&
        e1?.dateTime == e2?.dateTime &&
        e1?.acctNum == e2?.acctNum &&
        e1?.paymentType == e2?.paymentType &&
        e1?.recieptNo == e2?.recieptNo &&
        listEquality.equals(e1?.incentive, e2?.incentive) &&
        listEquality.equals(e1?.penalty, e2?.penalty) &&
        e1?.uid == e2?.uid &&
        e1?.company == e2?.company &&
        e1?.chequeDate == e2?.chequeDate &&
        e1?.chequeNo == e2?.chequeNo &&
        e1?.subBank == e2?.subBank &&
        e1?.subName == e2?.subName &&
        e1?.morD == e2?.morD;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.collectedAmt,
        e?.installmentNum,
        e?.dateTime,
        e?.acctNum,
        e?.paymentType,
        e?.recieptNo,
        e?.incentive,
        e?.penalty,
        e?.uid,
        e?.company,
        e?.chequeDate,
        e?.chequeNo,
        e?.subBank,
        e?.subName,
        e?.morD
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
