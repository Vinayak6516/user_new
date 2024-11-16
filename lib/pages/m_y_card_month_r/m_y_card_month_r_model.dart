import '/flutter_flow/flutter_flow_util.dart';
import 'm_y_card_month_r_widget.dart' show MYCardMonthRWidget;
import 'package:flutter/material.dart';

class MYCardMonthRModel extends FlutterFlowModel<MYCardMonthRWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
