import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TranferHistoryListRecord extends FirestoreRecord {
  TranferHistoryListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "credit" field.
  double? _credit;
  double get credit => _credit ?? 0.0;
  bool hasCredit() => _credit != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _credit = castToType<double>(snapshotData['credit']);
    _type = snapshotData['type'] as String?;
    _status = castToType<int>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tranfer_history_list');

  static Stream<TranferHistoryListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TranferHistoryListRecord.fromSnapshot(s));

  static Future<TranferHistoryListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TranferHistoryListRecord.fromSnapshot(s));

  static TranferHistoryListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TranferHistoryListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TranferHistoryListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TranferHistoryListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TranferHistoryListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TranferHistoryListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranferHistoryListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  double? credit,
  String? type,
  int? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'credit': credit,
      'type': type,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class TranferHistoryListRecordDocumentEquality
    implements Equality<TranferHistoryListRecord> {
  const TranferHistoryListRecordDocumentEquality();

  @override
  bool equals(TranferHistoryListRecord? e1, TranferHistoryListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.credit == e2?.credit &&
        e1?.type == e2?.type &&
        e1?.status == e2?.status;
  }

  @override
  int hash(TranferHistoryListRecord? e) => const ListEquality()
      .hash([e?.createDate, e?.createBy, e?.credit, e?.type, e?.status]);

  @override
  bool isValidKey(Object? o) => o is TranferHistoryListRecord;
}
