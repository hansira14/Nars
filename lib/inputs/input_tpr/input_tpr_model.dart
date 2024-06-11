import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'input_tpr_widget.dart' show InputTprWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputTprModel extends FlutterFlowModel<InputTprWidget> {
  ///  Local state fields for this component.

  double temp = 36.0;

  int pulse = 80;

  int respiration = 14;

  ///  State fields for stateful widgets in this component.

  // State field(s) for temp widget.
  FocusNode? tempFocusNode;
  TextEditingController? tempTextController;
  String? Function(BuildContext, String?)? tempTextControllerValidator;
  // State field(s) for pulse widget.
  FocusNode? pulseFocusNode;
  TextEditingController? pulseTextController;
  String? Function(BuildContext, String?)? pulseTextControllerValidator;
  // State field(s) for resp widget.
  FocusNode? respFocusNode;
  TextEditingController? respTextController;
  String? Function(BuildContext, String?)? respTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tempFocusNode?.dispose();
    tempTextController?.dispose();

    pulseFocusNode?.dispose();
    pulseTextController?.dispose();

    respFocusNode?.dispose();
    respTextController?.dispose();
  }
}
