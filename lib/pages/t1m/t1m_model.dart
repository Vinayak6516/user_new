import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 't1m_widget.dart' show T1mWidget;
import 'package:flutter/material.dart';

class T1mModel extends FlutterFlowModel<T1mWidget> {
  ///  Local state fields for this page.

  List<TransactionsRecord> dataItem = [];
  void addToDataItem(TransactionsRecord item) => dataItem.add(item);
  void removeFromDataItem(TransactionsRecord item) => dataItem.remove(item);
  void removeAtIndexFromDataItem(int index) => dataItem.removeAt(index);
  void insertAtIndexInDataItem(int index, TransactionsRecord item) =>
      dataItem.insert(index, item);
  void updateDataItemAtIndex(
          int index, Function(TransactionsRecord) updateFn) =>
      dataItem[index] = updateFn(dataItem[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in t1m widget.
  List<TransactionsRecord>? var199;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<TransactionsRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
