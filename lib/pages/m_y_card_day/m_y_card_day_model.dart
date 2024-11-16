import '/flutter_flow/flutter_flow_util.dart';
import 'm_y_card_day_widget.dart' show MYCardDayWidget;
import 'package:flutter/material.dart';

class MYCardDayModel extends FlutterFlowModel<MYCardDayWidget> {
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
