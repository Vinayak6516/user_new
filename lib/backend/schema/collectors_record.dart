import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollectorsRecord extends FirestoreRecord {
  CollectorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _company = snapshotData['company'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('collectors');

  static Stream<CollectorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollectorsRecord.fromSnapshot(s));

  static Future<CollectorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CollectorsRecord.fromSnapshot(s));

  static CollectorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollectorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollectorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollectorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollectorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollectorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollectorsRecordData({
  String? uid,
  String? company,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'company': company,
    }.withoutNulls,
  );

  return firestoreData;
}

class CollectorsRecordDocumentEquality implements Equality<CollectorsRecord> {
  const CollectorsRecordDocumentEquality();

  @override
  bool equals(CollectorsRecord? e1, CollectorsRecord? e2) {
    return e1?.uid == e2?.uid && e1?.company == e2?.company;
  }

  @override
  int hash(CollectorsRecord? e) =>
      const ListEquality().hash([e?.uid, e?.company]);

  @override
  bool isValidKey(Object? o) => o is CollectorsRecord;
}
