import '/backend/backend.dart';
import '/components/logout_copy/logout_copy_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'add_transaction_m_model.dart';
export 'add_transaction_m_model.dart';

class AddTransactionMWidget extends StatefulWidget {
  const AddTransactionMWidget({
    super.key,
    required this.userParam,
    this.installmentNum,
  });

  final UsersRecord? userParam;
  final int? installmentNum;

  @override
  State<AddTransactionMWidget> createState() => _AddTransactionMWidgetState();
}

class _AddTransactionMWidgetState extends State<AddTransactionMWidget> {
  late AddTransactionMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTransactionMModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dataforTable = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord
            .where(
              'acct_num',
              isEqualTo: widget.userParam?.acctNum,
            )
            .where(
              'MorD',
              isEqualTo: 'Inst',
            )
            .orderBy('auction_no'),
      );
      _model.dataTableList = _model.dataforTable!.toList().cast<UsersRecord>();
      _model.tAmtCount = 0;
      setState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.suBankTextController ??= TextEditingController();
    _model.suBankFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<BanksRecord>>(
      stream: _model.rowquery2(
        requestFn: () => queryBanksRecord(),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCubeGrid(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<BanksRecord> addTransactionMBanksRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                      text: '',
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 35.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 51.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'b7xjhjdf' /*        Add Transaction */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController1',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    _model.transactionAmt = 0;
                                    _model.tAmtCount = 0;
                                    _model.incentive = [];
                                    _model.penalty = [];
                                    _model.inctCount = 0;
                                    _model.pnltCount = 0;
                                    _model.incSum = null;
                                    _model.pnlSum = null;
                                    setState(() {});
                                    _model.transactionAmt =int.parse(_model.textController1.text);
                                    setState(() {});
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '0z5kfd2f' /* Transaction Amount */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  suffixIcon: _model
                                          .textController1!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.textController1?.clear();
                                            _model.transactionAmt = 0;
                                            _model.tAmtCount = 0;
                                            _model.incentive = [];
                                            _model.penalty = [];
                                            _model.inctCount = 0;
                                            _model.pnltCount = 0;
                                            _model.incSum = null;
                                            _model.pnlSum = null;
                                            setState(() {});
                                            _model.transactionAmt =int.parse(_model.textController1.text);
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 22.0,
                                          ),
                                        ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'fsx1l80m' /* Payment Mode: */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 15.0, 10.0, 15.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(null),
                                      options: addTransactionMBanksRecordList
                                          .map((e) => e.bankName)
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue = val),
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'ogwmb6hi' /* Please select... */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 12.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (valueOrDefault<bool>(
                              (_model.dropDownValue != 'Cash') &&
                                  (_model.dropDownValue != null &&
                                      _model.dropDownValue != ''),
                              true,
                            ))
                              ListView(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ssbydsu7' /* Enter Cheque No.: */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        36.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController2,
                                                  focusNode: _model
                                                      .textFieldFocusNode2,
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'xdsy2zsb' /* Cheque No. */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .textController2Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7t5dtrlq' /* Enter Cheque Date: */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        final datePickedDate =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              getCurrentTimestamp,
                                                          firstDate:
                                                              getCurrentTimestamp,
                                                          lastDate:
                                                              DateTime(2050),
                                                        );

                                                        if (datePickedDate !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked =
                                                                DateTime(
                                                              datePickedDate
                                                                  .year,
                                                              datePickedDate
                                                                  .month,
                                                              datePickedDate
                                                                  .day,
                                                            );
                                                          });
                                                        }
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Container(
                                                          width: 175.0,
                                                          height: 50.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.44,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                _model.datePicked !=
                                                                        null
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        dateTimeFormat(
                                                                          "dd/MM/yy",
                                                                          _model
                                                                              .datePicked,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '0',
                                                                      )
                                                                    : dateTimeFormat(
                                                                        "dd/MM/yy",
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'npqvqiy2' /* Enter Subscriber Bank: */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .suBankTextController,
                                                  focusNode:
                                                      _model.suBankFocusNode,
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'zutyafqr' /* Subscriber Bank */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .suBankTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]
                                          .divide(const SizedBox(height: 15.0))
                                          .around(const SizedBox(height: 15.0)),
                                    ),
                                  ),
                                ],
                              ),
                            Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 15.0),
                                    child: Builder(
                                      builder: (context) {
                                        final dataTable1 = _model.dataTableList
                                            .take(72)
                                            .toList();

                                        return FlutterFlowDataTable<
                                            UsersRecord>(
                                          controller: _model
                                              .paginatedDataTableController,
                                          data: dataTable1,
                                          columnsBuilder: (onSortChanged) => [
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    't90jjv6n' /* Inst No. */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'tdibnuks' /* Auction Date */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '4p85zjei' /* Inst. Amt */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '0fhlfvlq' /* Amt. Due */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2nw9d5tx' /* Alloc. Amt */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'uncoze1k' /* Balance */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '81px9ix1' /* Incentive */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fzeaja5i' /* Penalty */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                          dataRowBuilder: (dataTable1Item,
                                                  dataTable1Index,
                                                  selected,
                                                  onSelectChanged) =>
                                              DataRow(
                                            color: WidgetStateProperty.all(
                                              dataTable1Index % 2 == 0
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            cells: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  dataTable1Item.auctionNo
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    dataTable1Item.auctionDate,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    dataTable1Item
                                                        .installmentAmt
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    dataTable1Item.balAmt
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if ((dataTable1Item
                                                                  .balAmt <
                                                              _model
                                                                  .transactionAmt) ||
                                                          (dataTable1Item
                                                                  .balAmt <
                                                              (_model
                                                                  .transactionAmt
                                                                  .abs()))) {
                                                        _model.transactionAmt =
                                                            () {
                                                          if ((_model.transactionAmt >=
                                                                  dataTable1Item
                                                                      .balAmt) ||
                                                              ((int var1,
                                                                      int var2) {
                                                                return var1
                                                                        .abs() >=
                                                                    var2;
                                                              }(
                                                                  _model
                                                                      .transactionAmt,
                                                                  dataTable1Item
                                                                      .balAmt))) {
                                                            return (dataTable1Item
                                                                    .balAmt -
                                                                _model
                                                                    .transactionAmt
                                                                    .abs());
                                                          } else if (_model
                                                                  .transactionAmt <
                                                              (dataTable1Item
                                                                      .balAmt -
                                                                  _model
                                                                      .transactionAmt
                                                                      .abs())) {
                                                            return 0;
                                                          } else {
                                                            return ((_model.transactionAmt <=
                                                                        dataTable1Item
                                                                            .balAmt) ||
                                                                    ((int var1,
                                                                            int
                                                                                var2) {
                                                                      return var1
                                                                              .abs() <=
                                                                          var2;
                                                                    }(
                                                                        _model
                                                                            .transactionAmt,
                                                                        dataTable1Item
                                                                            .balAmt))
                                                                ? (dataTable1Item
                                                                        .balAmt -
                                                                    _model
                                                                        .transactionAmt
                                                                        .abs())
                                                                : 0);
                                                          }
                                                        }();
                                                        _model.tAmtCount =
                                                            _model.tAmtCount +
                                                                1;
                                                        setState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Error!'),
                                                              content: const Text(
                                                                  'The amount cannot be further allocated please try  with a greater amount'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'OK'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                    onDoubleTap: () async {
                                                      if (_model.pnltCount >=
                                                          _model.inctCount) {
                                                        _model.insertAtIndexInPenalty(
                                                            _model.pnltCount,
                                                            _model.transactionAmt <
                                                                    0
                                                                ? (_model
                                                                    .transactionAmt
                                                                    .abs())
                                                                : _model
                                                                    .transactionAmt);
                                                        _model.transactionAmt =
                                                            0;
                                                        _model
                                                            .insertAtIndexInIncentive(
                                                                _model
                                                                    .pnltCount,
                                                                0);
                                                        setState(() {});
                                                        _model.pnltCount =
                                                            _model.pnltCount +
                                                                1;
                                                        _model.inctCount =
                                                            _model.inctCount +
                                                                1;
                                                        setState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Error!'),
                                                              content: const Text(
                                                                  'Penalty could not be allocated.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'OK'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        _model.dropDownValue !=
                                                                    null &&
                                                                _model.dropDownValue !=
                                                                    ''
                                                            ? valueOrDefault<
                                                                String>(
                                                                _model.transactionAmt !=
                                                                        null
                                                                    ? () {
                                                                        if ((_model.transactionAmt >= dataTable1Item.balAmt) &&
                                                                            (dataTable1Index ==
                                                                                0)) {
                                                                          return dataTable1Item
                                                                              .balAmt
                                                                              .toString();
                                                                        } else if (_model.penalty[_model.pnltCount -
                                                                                1] ==
                                                                            (_model.transactionAmt < 0
                                                                                ? (_model.transactionAmt.abs())
                                                                                : _model.transactionAmt)) {
                                                                          return (dataTable1Index < _model.tAmtCount
                                                                              ? dataTable1Item.balAmt.toString()
                                                                              : '0');
                                                                        } else {
                                                                          return () {
                                                                            if (dataTable1Index <
                                                                                _model.tAmtCount) {
                                                                              return dataTable1Item.balAmt.toString();
                                                                            } else if (dataTable1Index == _model.tAmtCount) {
                                                                              return (_model.transactionAmt < 0 ? (_model.transactionAmt == _model.penalty[_model.pnltCount - 1] ? '0' : (_model.transactionAmt.abs()).toString()) : (_model.transactionAmt == _model.penalty[_model.pnltCount - 1] ? '0' : _model.transactionAmt.toString()));
                                                                            } else {
                                                                              return '0';
                                                                            }
                                                                          }();
                                                                        }
                                                                      }()
                                                                    : '0',
                                                                '0',
                                                              )
                                                            : '0',
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.dropDownValue !=
                                                                  null &&
                                                              _model.dropDownValue !=
                                                                  ''
                                                          ? valueOrDefault<
                                                              String>(
                                                              _model.transactionAmt !=
                                                                      null
                                                                  ? () {
                                                                      if (dataTable1Index < _model.tAmtCount) {
                                                                        return '0';
                                                                      } else if (dataTable1Index == _model.tAmtCount) {
                                                                        return () {
                                                                          if (_model.incentive[dataTable1Index] ==
                                                                              (dataTable1Item.balAmt - _model.transactionAmt.abs())) {
                                                                            return '0';
                                                                          } else if (_model.incentive[dataTable1Index - 1] <= (dataTable1Item.balAmt - (_model.transactionAmt < 0 ? _model.transactionAmt : (_model.transactionAmt.abs())).abs())) {
                                                                            return (dataTable1Item.balAmt - _model.transactionAmt.abs()).toString();
                                                                          } else {
                                                                            return (dataTable1Item.balAmt - _model.transactionAmt.abs() < 0
                                                                                ? '0'
                                                                                : (dataTable1Item.balAmt - _model.transactionAmt.abs()).toString());
                                                                          }
                                                                        }();
                                                                      } else {
                                                                        return dataTable1Item
                                                                            .balAmt
                                                                            .toString();
                                                                      }
                                                                    }()
                                                                  : dataTable1Item
                                                                      .balAmt
                                                                      .toString(),
                                                              '0',
                                                            )
                                                          : dataTable1Item
                                                              .balAmt
                                                              .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if ((_model.inctCount <
                                                                  _model
                                                                      .tAmtCount) &&
                                                              ((_model.pnltCount >
                                                                      _model
                                                                          .inctCount) ||
                                                                  (_model.pnltCount <=
                                                                      _model
                                                                          .inctCount)) &&
                                                              (dataTable1Index >=
                                                                  (_model.inctCount +
                                                                      1))) {
                                                            if (_model
                                                                    .transactionAmt ==
                                                                0) {
                                                              _model
                                                                  .updateIncentiveAtIndex(
                                                                dataTable1Index -
                                                                    1,
                                                                (_) => (((1 / 100) * dataTable1Item.balAmt)
                                                                            .round()) <=
                                                                        0
                                                                    ? 0
                                                                    : ((dataTable1Item.balAmt *
                                                                            (1 /
                                                                                100))
                                                                        .round()),
                                                              );
                                                              _model
                                                                  .updatePenaltyAtIndex(
                                                                _model.pnltCount -
                                                                    1,
                                                                (e) =>
                                                                    e +
                                                                    ((((1 / 100) * dataTable1Item.balAmt).round()) <=
                                                                            0
                                                                        ? 0
                                                                        : ((dataTable1Item.balAmt *
                                                                                (1 / 100))
                                                                            .round())),
                                                              );
                                                              setState(() {});
                                                            } else {
                                                              _model
                                                                  .updateIncentiveAtIndex(
                                                                dataTable1Index -
                                                                    1,
                                                                (_) => (((1 / 100) * dataTable1Item.balAmt)
                                                                            .round()) <=
                                                                        0
                                                                    ? 0
                                                                    : ((dataTable1Item.balAmt *
                                                                            (1 /
                                                                                100))
                                                                        .round()),
                                                              );
                                                              setState(() {});
                                                            }

                                                            _model.inctCount =
                                                                _model.inctCount +
                                                                    1;
                                                            setState(() {});
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Error!'),
                                                                  content: const Text(
                                                                      'This insallment cannot be allocated with the incentive.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child: Text(
                                                          _model.pnltCount >
                                                                  _model
                                                                      .inctCount
                                                              ? '0'
                                                              : valueOrDefault<
                                                                  String>(
                                                                  (_model.incentive
                                                                              .isNotEmpty) ==
                                                                          true
                                                                      ? ((dataTable1Index < _model.inctCount) &&
                                                                              (_model.incentive[dataTable1Index] !=
                                                                                  null)
                                                                          ? _model
                                                                              .incentive[dataTable1Index]
                                                                              .toString()
                                                                          : '0')
                                                                      : '0',
                                                                  '0',
                                                                ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if ((_model.pnltCount <=
                                                                  _model
                                                                      .tAmtCount) &&
                                                              ((_model.inctCount <=
                                                                      0) ||
                                                                  (_model.inctCount <=
                                                                      0))) {
                                                            _model.insertAtIndexInPenalty(
                                                                _model
                                                                    .pnltCount,
                                                                ((1 / 100) *
                                                                        dataTable1Item
                                                                            .balAmt)
                                                                    .round());
                                                            _model.pnltCount =
                                                                _model.pnltCount +
                                                                    1;
                                                            setState(() {});
                                                            _model
                                                                .addToIncentive(
                                                                    0);
                                                            _model.inctCount =
                                                                _model.inctCount +
                                                                    1;
                                                            setState(() {});
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Error!'),
                                                                  content: const Text(
                                                                      'This installment cannot be allocated with a penalty'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            (_model.penalty
                                                                        .isNotEmpty) ==
                                                                    true
                                                                ? ((dataTable1Index <=
                                                                            _model
                                                                                .pnltCount) &&
                                                                        (_model.penalty[dataTable1Index] !=
                                                                            null)
                                                                    ? _model
                                                                        .penalty[
                                                                            dataTable1Index]
                                                                        .toString()
                                                                    : '0')
                                                                : '0',
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].map((c) => DataCell(c)).toList(),
                                          ),
                                          paginated: false,
                                          selectable: false,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          minWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  2.0,
                                          headingRowHeight: 50.0,
                                          dataRowHeight: 60.0,
                                          columnSpacing: 1.0,
                                          headingRowColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          addHorizontalDivider: true,
                                          addTopAndBottomDivider: true,
                                          hideDefaultHorizontalDivider: true,
                                          horizontalDividerColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          horizontalDividerThickness: 1.0,
                                          addVerticalDivider: true,
                                          verticalDividerColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          verticalDividerThickness: 1.0,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'd76i53ul' /* Amt Due */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.incSum = (List<int> var1) {
                                        return var1.reduce((a, b) => a + b);
                                      }((_model.incentive.isNotEmpty
                                              ? _model.incentive
                                              : List.generate(
                                                  random_data.randomInteger(
                                                      2, 5),
                                                  (index) => random_data
                                                      .randomInteger(0, 0)))
                                          .toList());
                                      _model.pnlSum = (List<int> var1) {
                                        return var1.reduce((a, b) => a + b);
                                      }(_model.penalty.toList());
                                      _model.sum = (List<int> var1) {
                                        return var1.reduce((a, b) => a + b);
                                      }(_model.dataforTable!
                                          .map((e) => e.balAmt)
                                          .toList());
                                      setState(() {});
                                    },
                                    child: Text(
                                      ((List<int> var1) {
                                        return var1.reduce((a, b) => a + b);
                                      }(_model.dataforTable!
                                              .take(15)
                                              .toList()
                                              .map((e) => e.balAmt)
                                              .toList()))
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '4pgitbl9' /* Collected Amt */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    _model.textController1.text,
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
                            if (_model.incentive.isNotEmpty)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'x1llgc5o' /* Incentive Amt */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      ((List<int> var1) {
                                        return var1.reduce((a, b) => a + b);
                                      }(_model.incentive.toList()))
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
                              ),
                            if (_model.penalty.isNotEmpty)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'jzvnkfb7' /* Penalty Amt */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      ((List<int> var1) {
                                        return var1.reduce((a, b) => a + b);
                                      }(_model.penalty.toList()))
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
                              ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'g3rk4zir' /* Net Amt Due */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  if (_model.sum != null)
                                    Text(
                                      (((_model.sum!) + (_model.pnlSum!)) -
                                              (int.parse(_model
                                                      .textController1.text) -
                                                  (_model.incSum!)))
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
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (((_model.textController1.text !=
                                                    '') &&
                                            (_model.dropDownValue == 'Cash')) ||
                                        (((_model.textController1
                                                            .text !=
                                                        '') &&
                                                (_model.textController2
                                                            .text !=
                                                        '') &&
                                                (_model.datePicked != null) &&
                                                (_model.suBankTextController
                                                            .text !=
                                                        '')) &&
                                            (_model.dropDownValue != 'Cash'))) {
                                      _model.var211 =
                                          await queryUsersRecordOnce(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord
                                                .where(
                                                  'uid',
                                                  isEqualTo:
                                                      widget.userParam?.uid,
                                                )
                                                .where(
                                                  'MorD',
                                                  isEqualTo: 'Inst',
                                                )
                                                .where(
                                                  'company',
                                                  isEqualTo: widget
                                                      .userParam?.company,
                                                )
                                                .where(
                                                  'acct_num',
                                                  isEqualTo: widget
                                                      .userParam?.acctNum,
                                                )
                                                .orderBy('auction_no'),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      unawaited(
                                        () async {
                                          await _model.var211!.reference
                                              .update(createUsersRecordData(
                                            collectedAmt: int.tryParse(
                                                _model.textController1.text),
                                          ));
                                        }(),
                                      );

                                      await TransactionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createTransactionsRecordData(
                                          collectedAmt: int.tryParse(
                                              _model.textController1.text),
                                          acctNum: widget.userParam?.acctNum,
                                          dateTime: getCurrentTimestamp,
                                          installmentNum:
                                              widget.userParam?.auctionNo,
                                          paymentType:
                                              '${_model.dropDownValue}-',
                                          recieptNo:
                                              '${FFAppState().collectID.toString()}-${FFAppState().prefix}M${FFAppState().recieptNo.toString()}',
                                          uid: widget.userParam?.uid,
                                          company: widget.userParam?.company,
                                          chequeDate: _model.datePicked,
                                          chequeNo: _model.textController2.text,
                                          subBank:
                                              _model.suBankTextController.text,
                                          subName: _model.var211?.displayName,
                                          morD: 'M',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'Incentive': _model.incentive,
                                            'penalty': _model.penalty,
                                          },
                                        ),
                                      });
                                      FFAppState().recieptNo =
                                          FFAppState().recieptNo + 1;
                                      setState(() {});
                                      context.safePop();
                                      if (isiOS) {
                                        await launchUrl(Uri.parse(
                                            "sms:${widget.userParam!.phone}&body=${Uri.encodeComponent('Dear Subscriber, Your account${widget.userParam?.acctNum.toString()}is credited with Rs.${_model.textController1.text}')}"));
                                      } else {
                                        await launchUrl(Uri(
                                          scheme: 'sms',
                                          path: widget.userParam!.phone,
                                          queryParameters: <String, String>{
                                            'body':
                                                'Dear Subscriber, Your account${widget.userParam?.acctNum.toString()}is credited with Rs.${_model.textController1.text}',
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
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(dialogContext)
                                                      .unfocus(),
                                              child: const LogoutCopyWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Fill the form completely!'),
                                            content: const Text(
                                                'Make sure you have filled in all the required data required.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'xc46plkg' /* Add Transaction */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 55.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}