import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 't1d_widget.dart' show T1dWidget;
import 'package:flutter/material.dart';

class T1dModel extends FlutterFlowModel<T1dWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in t1d widget.
  List<TransactionsRecord>? var99;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<TransactionsRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
