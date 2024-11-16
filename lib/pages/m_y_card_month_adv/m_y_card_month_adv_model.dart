import '/flutter_flow/flutter_flow_util.dart';
import 'm_y_card_month_adv_widget.dart' show MYCardMonthAdvWidget;
import 'package:flutter/material.dart';

class MYCardMonthAdvModel extends FlutterFlowModel<MYCardMonthAdvWidget> {
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
