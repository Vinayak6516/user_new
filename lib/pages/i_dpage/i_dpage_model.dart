import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'i_dpage_widget.dart' show IDpageWidget;
import 'package:flutter/material.dart';

class IDpageModel extends FlutterFlowModel<IDpageWidget> {
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

  ///  State fields for stateful widgets in this page.

  // State field(s) for company widget.
  FocusNode? companyFocusNode1;
  TextEditingController? companyTextController1;
  String? Function(BuildContext, String?)? companyTextController1Validator;
  // State field(s) for company widget.
  FocusNode? companyFocusNode2;
  TextEditingController? companyTextController2;
  String? Function(BuildContext, String?)? companyTextController2Validator;
  // State field(s) for company widget.
  FocusNode? companyFocusNode3;
  TextEditingController? companyTextController3;
  String? Function(BuildContext, String?)? companyTextController3Validator;
  // State field(s) for company widget.
  FocusNode? companyFocusNode4;
  TextEditingController? companyTextController4;
  String? Function(BuildContext, String?)? companyTextController4Validator;
  // State field(s) for collect_id widget.
  FocusNode? collectIdFocusNode;
  TextEditingController? collectIdTextController;
  String? Function(BuildContext, String?)? collectIdTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    companyFocusNode1?.dispose();
    companyTextController1?.dispose();

    companyFocusNode2?.dispose();
    companyTextController2?.dispose();

    companyFocusNode3?.dispose();
    companyTextController3?.dispose();

    companyFocusNode4?.dispose();
    companyTextController4?.dispose();

    collectIdFocusNode?.dispose();
    collectIdTextController?.dispose();
  }
}
