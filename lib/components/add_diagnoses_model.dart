import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_diagnoses_widget.dart' show AddDiagnosesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDiagnosesModel extends FlutterFlowModel<AddDiagnosesWidget> {
  ///  Local state fields for this component.

  List<String> diagnoses = [];
  void addToDiagnoses(String item) => diagnoses.add(item);
  void removeFromDiagnoses(String item) => diagnoses.remove(item);
  void removeAtIndexFromDiagnoses(int index) => diagnoses.removeAt(index);
  void insertAtIndexInDiagnoses(int index, String item) =>
      diagnoses.insert(index, item);
  void updateDiagnosesAtIndex(int index, Function(String) updateFn) =>
      diagnoses[index] = updateFn(diagnoses[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for inputsakit widget.
  FocusNode? inputsakitFocusNode;
  TextEditingController? inputsakitTextController;
  String? Function(BuildContext, String?)? inputsakitTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputsakitFocusNode?.dispose();
    inputsakitTextController?.dispose();
  }
}
