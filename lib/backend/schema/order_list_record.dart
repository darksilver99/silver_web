import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderListRecord extends FirestoreRecord {
  OrderListRecord._(
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

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  bool hasProduct() => _product != null;

  // "product_status" field.
  String? _productStatus;
  String get productStatus => _productStatus ?? '';
  bool hasProductStatus() => _productStatus != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _product = snapshotData['product'] as String?;
    _productStatus = snapshotData['product_status'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_list');

  static Stream<OrderListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderListRecord.fromSnapshot(s));

  static Future<OrderListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderListRecord.fromSnapshot(s));

  static OrderListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  String? product,
  String? productStatus,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'product': product,
      'product_status': productStatus,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderListRecordDocumentEquality implements Equality<OrderListRecord> {
  const OrderListRecordDocumentEquality();

  @override
  bool equals(OrderListRecord? e1, OrderListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.product == e2?.product &&
        e1?.productStatus == e2?.productStatus &&
        e1?.price == e2?.price;
  }

  @override
  int hash(OrderListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.status,
        e?.product,
        e?.productStatus,
        e?.price
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderListRecord;
}
