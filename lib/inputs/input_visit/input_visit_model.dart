import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'input_visit_widget.dart' show InputVisitWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputVisitModel extends FlutterFlowModel<InputVisitWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputname widget.
  FocusNode? inputnameFocusNode;
  TextEditingController? inputnameTextController;
  String? Function(BuildContext, String?)? inputnameTextControllerValidator;
  // State field(s) for gender widget.
  FormFieldController<List<String>>? genderValueController;
  String? get genderValue => genderValueController?.value?.firstOrNull;
  set genderValue(String? val) =>
      genderValueController?.value = val != null ? [val] : [];
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for inputrelation widget.
  FocusNode? inputrelationFocusNode;
  TextEditingController? inputrelationTextController;
  String? Function(BuildContext, String?)? inputrelationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputnameFocusNode?.dispose();
    inputnameTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    inputrelationFocusNode?.dispose();
    inputrelationTextController?.dispose();
  }
}
