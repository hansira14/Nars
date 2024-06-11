// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<DocumentReference>?> getNurseList(
  DocumentReference? nurse1,
  DocumentReference? nurse2,
  DocumentReference? nurse3,
) async {
  // generate a list of document references from the parameters
  List<DocumentReference> nurseList = [];

  if (nurse1 != null) {
    nurseList.add(nurse1);
  }

  if (nurse2 != null) {
    nurseList.add(nurse2);
  }

  if (nurse3 != null) {
    nurseList.add(nurse3);
  }

  return nurseList.isEmpty ? null : nurseList;
}
