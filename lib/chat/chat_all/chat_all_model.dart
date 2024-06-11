import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/patient_nav/patient_nav_widget.dart';
import '/doctor/doc_nav/doc_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nurse/nurse_navbar/nurse_navbar_widget.dart';
import 'chat_all_widget.dart' show ChatAllWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatAllModel extends FlutterFlowModel<ChatAllWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for nurseNavbar component.
  late NurseNavbarModel nurseNavbarModel;
  // Model for docNav component.
  late DocNavModel docNavModel;
  // Model for patientNav component.
  late PatientNavModel patientNavModel;

  @override
  void initState(BuildContext context) {
    nurseNavbarModel = createModel(context, () => NurseNavbarModel());
    docNavModel = createModel(context, () => DocNavModel());
    patientNavModel = createModel(context, () => PatientNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nurseNavbarModel.dispose();
    docNavModel.dispose();
    patientNavModel.dispose();
  }
}
