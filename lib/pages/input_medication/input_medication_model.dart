import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/doctor_list/doctor_list_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'input_medication_widget.dart' show InputMedicationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputMedicationModel extends FlutterFlowModel<InputMedicationWidget> {
  ///  Local state fields for this page.

  DateTime? firstdose;

  UsersRecord? doctor;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in input_Medication widget.
  UsersRecord? currentdoc;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  DateTime? datePicked;
  // State field(s) for intputname widget.
  FocusNode? intputnameFocusNode;
  TextEditingController? intputnameTextController;
  String? Function(BuildContext, String?)? intputnameTextControllerValidator;
  // State field(s) for inoutfreq widget.
  FocusNode? inoutfreqFocusNode;
  TextEditingController? inoutfreqTextController;
  String? Function(BuildContext, String?)? inoutfreqTextControllerValidator;
  // State field(s) for intputdura widget.
  FocusNode? intputduraFocusNode;
  TextEditingController? intputduraTextController;
  String? Function(BuildContext, String?)? intputduraTextControllerValidator;
  // State field(s) for doctor widget.
  FocusNode? doctorFocusNode;
  TextEditingController? doctorTextController;
  String? Function(BuildContext, String?)? doctorTextControllerValidator;
  // Stores action output result for [Bottom Sheet - DoctorList] action in Button widget.
  UsersRecord? doc;
  // State field(s) for inputroute widget.
  String? inputrouteValue;
  FormFieldController<String>? inputrouteValueController;
  // State field(s) for inpdosage widget.
  FocusNode? inpdosageFocusNode;
  TextEditingController? inpdosageTextController;
  String? Function(BuildContext, String?)? inpdosageTextControllerValidator;
  // State field(s) for inputnote widget.
  FocusNode? inputnoteFocusNode;
  TextEditingController? inputnoteTextController;
  String? Function(BuildContext, String?)? inputnoteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    intputnameFocusNode?.dispose();
    intputnameTextController?.dispose();

    inoutfreqFocusNode?.dispose();
    inoutfreqTextController?.dispose();

    intputduraFocusNode?.dispose();
    intputduraTextController?.dispose();

    doctorFocusNode?.dispose();
    doctorTextController?.dispose();

    inpdosageFocusNode?.dispose();
    inpdosageTextController?.dispose();

    inputnoteFocusNode?.dispose();
    inputnoteTextController?.dispose();
  }
}
