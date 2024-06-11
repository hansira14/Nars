import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/doctor_list/doctor_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'input_lab_widget.dart' show InputLabWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputLabModel extends FlutterFlowModel<InputLabWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? sd;

  String state = 'No file uploaded';

  UsersRecord? doctor;

  ///  State fields for stateful widgets in this component.

  // State field(s) for inputname widget.
  FocusNode? inputnameFocusNode;
  TextEditingController? inputnameTextController;
  String? Function(BuildContext, String?)? inputnameTextControllerValidator;
  // State field(s) for inputrange widget.
  FocusNode? inputrangeFocusNode;
  TextEditingController? inputrangeTextController;
  String? Function(BuildContext, String?)? inputrangeTextControllerValidator;
  // State field(s) for inputresult widget.
  FocusNode? inputresultFocusNode;
  TextEditingController? inputresultTextController;
  String? Function(BuildContext, String?)? inputresultTextControllerValidator;
  // State field(s) for doctor widget.
  FocusNode? doctorFocusNode;
  TextEditingController? doctorTextController;
  String? Function(BuildContext, String?)? doctorTextControllerValidator;
  // Stores action output result for [Bottom Sheet - DoctorList] action in Button widget.
  UsersRecord? doc;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LabtestsRecord? newlab;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputnameFocusNode?.dispose();
    inputnameTextController?.dispose();

    inputrangeFocusNode?.dispose();
    inputrangeTextController?.dispose();

    inputresultFocusNode?.dispose();
    inputresultTextController?.dispose();

    doctorFocusNode?.dispose();
    doctorTextController?.dispose();
  }
}
