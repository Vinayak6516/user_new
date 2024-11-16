import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/request_manager.dart';

import 'add_transaction_m_widget.dart' show AddTransactionMWidget;
import 'package:flutter/material.dart';

class AddTransactionMModel extends FlutterFlowModel<AddTransactionMWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> dataTableList = [];
  void addToDataTableList(UsersRecord item) => dataTableList.add(item);
  void removeFromDataTableList(UsersRecord item) => dataTableList.remove(item);
  void removeAtIndexFromDataTableList(int index) =>
      dataTableList.removeAt(index);
  void insertAtIndexInDataTableList(int index, UsersRecord item) =>
      dataTableList.insert(index, item);
  void updateDataTableListAtIndex(int index, Function(UsersRecord) updateFn) =>
      dataTableList[index] = updateFn(dataTableList[index]);

  int transactionAmt = 0;

  int tAmtCount = 0;

  int? sum;

  List<int> incentive = [];
  void addToIncentive(int item) => incentive.add(item);
  void removeFromIncentive(int item) => incentive.remove(item);
  void removeAtIndexFromIncentive(int index) => incentive.removeAt(index);
  void insertAtIndexInIncentive(int index, int item) =>
      incentive.insert(index, item);
  void updateIncentiveAtIndex(int index, Function(int) updateFn) =>
      incentive[index] = updateFn(incentive[index]);

  bool inctve = false;

  List<int> penalty = [];
  void addToPenalty(int item) => penalty.add(item);
  void removeFromPenalty(int item) => penalty.remove(item);
  void removeAtIndexFromPenalty(int index) => penalty.removeAt(index);
  void insertAtIndexInPenalty(int index, int item) =>
      penalty.insert(index, item);
  void updatePenaltyAtIndex(int index, Function(int) updateFn) =>
      penalty[index] = updateFn(penalty[index]);

  bool pnlt = false;

  int inctCount = 0;

  int pnltCount = 0;

  int? incSum;

  int? pnlSum;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in add_transactionM widget.
  List<UsersRecord>? dataforTable;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked;
  // State field(s) for suBank widget.
  FocusNode? suBankFocusNode;
  TextEditingController? suBankTextController;
  String? Function(BuildContext, String?)? suBankTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? var211;

  /// Query cache managers for this widget.

  final _rowquery2Manager = StreamRequestManager<List<BanksRecord>>();
  Stream<List<BanksRecord>> rowquery2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BanksRecord>> Function() requestFn,
  }) =>
      _rowquery2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRowquery2Cache() => _rowquery2Manager.clear();
  void clearRowquery2CacheKey(String? uniqueKey) =>
      _rowquery2Manager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    suBankFocusNode?.dispose();
    suBankTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearRowquery2Cache();
  }
}
