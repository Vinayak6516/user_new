// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:download/download.dart';
import 'dart:convert';

Future newCustomAction2(List<TransactionsRecord>? docs) async {
  // Add your function code here!
  docs = docs ?? [];

  // Add the company name and address as a header
  String fileContent = "collectedAmt,acct_num,paymentType,\n";
  docs.asMap().forEach((index, record) => fileContent = fileContent +
      record.collectedAmt.toString() +
      "," +
      record.acctNum.toString() +
      "," +
      record.paymentType.toString() +
      "\n");
  // Example of date formating thanks to Edmund Ong
  // DateFormat('dd-MM-yyyy').format(record.attendanceDate!) +
  //     "," +
  //     DateFormat('HH:mm').format(record.timeIn!) +
  //     "," +

  final fileName = "TransactionsFF" + DateTime.now().toString();

  // Encode the string as a List<int> of UTF-8 bytes
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);
  return download(stream, fileName);
}
