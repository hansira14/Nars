import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_doctor_widget.dart' show AddDoctorWidget;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDoctorModel extends FlutterFlowModel<AddDoctorWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for fname widget.
  FocusNode? fnameFocusNode;
  TextEditingController? fnameTextController;
  String? Function(BuildContext, String?)? fnameTextControllerValidator;
  // State field(s) for mname widget.
  FocusNode? mnameFocusNode;
  TextEditingController? mnameTextController;
  String? Function(BuildContext, String?)? mnameTextControllerValidator;
  // State field(s) for lname widget.
  FocusNode? lnameFocusNode;
  TextEditingController? lnameTextController;
  String? Function(BuildContext, String?)? lnameTextControllerValidator;
  // State field(s) for specialty widget.
  String? specialtyValue;
  FormFieldController<String>? specialtyValueController;
  // Stores action output result for [Cloud Function - createUserAccount] action in Button widget.
  CreateUserAccountCloudFunctionCallResponse? clouduser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fnameFocusNode?.dispose();
    fnameTextController?.dispose();

    mnameFocusNode?.dispose();
    mnameTextController?.dispose();

    lnameFocusNode?.dispose();
    lnameTextController?.dispose();
  }
}
