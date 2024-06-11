import '/admin/choose_patient/choose_patient_widget.dart';
import '/admin/input_lab/input_lab_widget.dart';
import '/backend/backend.dart';
import '/doctor/add_doctor/add_doctor_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_add_widget.dart' show AdminAddWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddModel extends FlutterFlowModel<AdminAddWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - choosePatient] action in Container widget.
  PatientRecord? chosenpatient;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
