import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/dataview/dataview_widget.dart';
import '/components/intake_outake/intake_outake_widget.dart';
import '/components/lab_tests_card/lab_tests_card_widget.dart';
import '/components/nurse_add/nurse_add_widget.dart';
import '/components/nursenotes/nursenotes_widget.dart';
import '/components/patientcard/patientcard_widget.dart';
import '/components/visitlogs/visitlogs_widget.dart';
import '/doctor/doctor_add/doctor_add_widget.dart';
import '/doctor/doctorsorder/doctorsorder_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'about_patient_widget.dart' show AboutPatientWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutPatientModel extends FlutterFlowModel<AboutPatientWidget> {
  ///  Local state fields for this page.

  String charts = 'Information';

  bool tableView = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // Model for patientcard component.
  late PatientcardModel patientcardModel;

  @override
  void initState(BuildContext context) {
    patientcardModel = createModel(context, () => PatientcardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController1?.dispose();
    tabBarController2?.dispose();
    patientcardModel.dispose();
  }
}
