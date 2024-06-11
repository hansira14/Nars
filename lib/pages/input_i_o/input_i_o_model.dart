import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'input_i_o_widget.dart' show InputIOWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputIOModel extends FlutterFlowModel<InputIOWidget> {
  ///  Local state fields for this page.

  bool isIntake = true;

  List<String> opIntake = [
    'Oral',
    'IV',
    'Tube',
    'Skin Patch',
    'Rectal',
    'Other'
  ];
  void addToOpIntake(String item) => opIntake.add(item);
  void removeFromOpIntake(String item) => opIntake.remove(item);
  void removeAtIndexFromOpIntake(int index) => opIntake.removeAt(index);
  void insertAtIndexInOpIntake(int index, String item) =>
      opIntake.insert(index, item);
  void updateOpIntakeAtIndex(int index, Function(String) updateFn) =>
      opIntake[index] = updateFn(opIntake[index]);

  List<String> opOutput = [
    'Urine',
    'Stool',
    'Drainage',
    'Emesis',
    'Blood',
    'Other'
  ];
  void addToOpOutput(String item) => opOutput.add(item);
  void removeFromOpOutput(String item) => opOutput.remove(item);
  void removeAtIndexFromOpOutput(int index) => opOutput.removeAt(index);
  void insertAtIndexInOpOutput(int index, String item) =>
      opOutput.insert(index, item);
  void updateOpOutputAtIndex(int index, Function(String) updateFn) =>
      opOutput[index] = updateFn(opOutput[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  // State field(s) for measurement widget.
  FocusNode? measurementFocusNode;
  TextEditingController? measurementTextController;
  String? Function(BuildContext, String?)? measurementTextControllerValidator;
  // State field(s) for unit widget.
  String? unitValue;
  FormFieldController<String>? unitValueController;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InoutRecord? inout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    measurementFocusNode?.dispose();
    measurementTextController?.dispose();

    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
