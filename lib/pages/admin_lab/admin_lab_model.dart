import '/admin/choose_patient/choose_patient_widget.dart';
import '/admin/input_lab/input_lab_widget.dart';
import '/admin/navbar_admin/navbar_admin_widget.dart';
import '/backend/backend.dart';
import '/components/lab_tests_card/lab_tests_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_lab_widget.dart' show AdminLabWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminLabModel extends FlutterFlowModel<AdminLabWidget> {
  ///  Local state fields for this page.

  DateTime? firstdose;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Bottom Sheet - choosePatient] action in Icon widget.
  PatientRecord? chosenpatient;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for navbarAdmin component.
  late NavbarAdminModel navbarAdminModel;

  @override
  void initState(BuildContext context) {
    navbarAdminModel = createModel(context, () => NavbarAdminModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navbarAdminModel.dispose();
  }
}
