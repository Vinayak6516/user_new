import '/backend/backend.dart';
import '/components/logout_copy/logout_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'add_transaction_model.dart';
export 'add_transaction_model.dart';

class AddTransactionWidget extends StatefulWidget {
  const AddTransactionWidget({
    super.key,
    required this.userParam,
    this.transaction,
  });

  final UsersRecord? userParam;
  final TransactionsRecord? transaction;

  @override
  State<AddTransactionWidget> createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  late AddTransactionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTransactionModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 349.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.safePop();
                            },
                            text: '',
                            icon: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'nlltqk1h' /* Add Transaction */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'i5y41ole' /* Transaction Amount */,
                      ),
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Lexend',
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'ugdahbgv' /* Enter transaction amount */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyLarge
                          .override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lexend',
                          letterSpacing: 0.0,
                        ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                if (_model.textController.text != '')
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '933tnn3v' /* Current Balance */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.userParam?.curBal.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'wrnnp2bh' /* Collected Amount */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              _model.textController.text,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent1,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'gzaqf5qh' /* Total: */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            (widget.userParam!.curBal +
                                    int.parse(_model.textController.text))
                                .toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (widget.userParam?.morD == 'Daily') {
                          if (_model.textController.text != '') {
                            await widget.userParam!.reference
                                .update(createUsersRecordData(
                              acctNum: widget.userParam?.acctNum,
                              collectedAmt:
                                  int.tryParse(_model.textController.text),
                              auctionNo: widget.userParam?.auctionNo,
                            ));

                            await TransactionsRecord.collection.doc().set({
                              ...createTransactionsRecordData(
                                collectedAmt:
                                    int.tryParse(_model.textController.text),
                                installmentNum: widget.userParam?.auctionNo,
                                acctNum: widget.userParam?.acctNum,
                                recieptNo:
                                    '${FFAppState().collectID.toString()}-${FFAppState().prefix}D${formatNumber(
                                  FFAppState().recieptNo,
                                  formatType: FormatType.custom,
                                  format: '#####',
                                  locale: '',
                                )}',
                                morD: 'D',
                              ),
                              ...mapToFirestore(
                                {
                                  'dateTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            FFAppState().recieptNo = FFAppState().recieptNo + 1;
                            FFAppState().update(() {});
                            if (isiOS) {
                              await launchUrl(Uri.parse(
                                  "sms:${widget.userParam!.phone}&body=${Uri.encodeComponent('Dear Subscriber, Your account${widget.userParam?.acctNum.toString()}is credited with Rs.${_model.textController.text}')}"));
                            } else {
                              await launchUrl(Uri(
                                scheme: 'sms',
                                path: widget.userParam!.phone,
                                queryParameters: <String, String>{
                                  'body':
                                      'Dear Subscriber, Your account${widget.userParam?.acctNum.toString()}is credited with Rs.${_model.textController.text}',
                                },
                              ));
                            }

                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(dialogContext).unfocus(),
                                    child: const LogoutCopyWidget(),
                                  ),
                                );
                              },
                            );

                            context.safePop();
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Enter transaction amount!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.pushNamed(
                              'add_transaction',
                              queryParameters: {
                                'userParam': serializeParam(
                                  widget.userParam,
                                  ParamType.Document,
                                ),
                                'transaction': serializeParam(
                                  widget.transaction,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'userParam': widget.userParam,
                                'transaction': widget.transaction,
                              },
                            );
                          }
                        } else {
                          if (_model.textController.text != '') {
                            await widget.userParam!.reference
                                .update(createUsersRecordData(
                              acctNum: widget.userParam?.acctNum,
                              collectedAmt:
                                  int.tryParse(_model.textController.text),
                              auctionNo: widget.userParam?.auctionNo,
                            ));

                            await TransactionsRecord.collection.doc().set({
                              ...createTransactionsRecordData(
                                collectedAmt:
                                    int.tryParse(_model.textController.text),
                                installmentNum: widget.userParam?.auctionNo,
                                acctNum: widget.userParam?.acctNum,
                                recieptNo:
                                    '${FFAppState().collectID.toString()}-${FFAppState().prefix}M${formatNumber(
                                  FFAppState().recieptNo,
                                  formatType: FormatType.custom,
                                  format: '#####',
                                  locale: '',
                                )}',
                                morD: 'M',
                              ),
                              ...mapToFirestore(
                                {
                                  'dateTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            FFAppState().recieptNo = FFAppState().recieptNo + 1;
                            FFAppState().update(() {});
                            if (isiOS) {
                              await launchUrl(Uri.parse(
                                  "sms:${widget.userParam!.phone}&body=${Uri.encodeComponent('Dear Subscriber, Your account${widget.userParam?.acctNum.toString()}is credited with Rs.${_model.textController.text}')}"));
                            } else {
                              await launchUrl(Uri(
                                scheme: 'sms',
                                path: widget.userParam!.phone,
                                queryParameters: <String, String>{
                                  'body':
                                      'Dear Subscriber, Your account${widget.userParam?.acctNum.toString()}is credited with Rs.${_model.textController.text}',
                                },
                              ));
                            }

                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(dialogContext).unfocus(),
                                    child: const LogoutCopyWidget(),
                                  ),
                                );
                              },
                            );

                            context.safePop();
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Enter transaction amount!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.pushNamed(
                              'add_transaction',
                              queryParameters: {
                                'userParam': serializeParam(
                                  widget.userParam,
                                  ParamType.Document,
                                ),
                                'transaction': serializeParam(
                                  widget.transaction,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'userParam': widget.userParam,
                                'transaction': widget.transaction,
                              },
                            );
                          }
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        '4w8s0hce' /* Add Transaction */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 55.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Lexend',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
