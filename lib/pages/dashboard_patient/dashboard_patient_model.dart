import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/patient_nav/patient_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_patient_widget.dart' show DashboardPatientWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardPatientModel extends FlutterFlowModel<DashboardPatientWidget> {
  ///  Local state fields for this page.

  DateTime? firstdose;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  NotificationsRecord? emergency;
  // Model for patientNav component.
  late PatientNavModel patientNavModel;

  @override
  void initState(BuildContext context) {
    patientNavModel = createModel(context, () => PatientNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    patientNavModel.dispose();
  }
}
