import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'input_treatment_widget.dart' show InputTreatmentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputTreatmentModel extends FlutterFlowModel<InputTreatmentWidget> {
  ///  Local state fields for this page.

  List<String> procedures = [];
  void addToProcedures(String item) => procedures.add(item);
  void removeFromProcedures(String item) => procedures.remove(item);
  void removeAtIndexFromProcedures(int index) => procedures.removeAt(index);
  void insertAtIndexInProcedures(int index, String item) =>
      procedures.insert(index, item);
  void updateProceduresAtIndex(int index, Function(String) updateFn) =>
      procedures[index] = updateFn(procedures[index]);

  List<String> lifestylemod = [];
  void addToLifestylemod(String item) => lifestylemod.add(item);
  void removeFromLifestylemod(String item) => lifestylemod.remove(item);
  void removeAtIndexFromLifestylemod(int index) => lifestylemod.removeAt(index);
  void insertAtIndexInLifestylemod(int index, String item) =>
      lifestylemod.insert(index, item);
  void updateLifestylemodAtIndex(int index, Function(String) updateFn) =>
      lifestylemod[index] = updateFn(lifestylemod[index]);

  List<String> followup = [];
  void addToFollowup(String item) => followup.add(item);
  void removeFromFollowup(String item) => followup.remove(item);
  void removeAtIndexFromFollowup(int index) => followup.removeAt(index);
  void insertAtIndexInFollowup(int index, String item) =>
      followup.insert(index, item);
  void updateFollowupAtIndex(int index, Function(String) updateFn) =>
      followup[index] = updateFn(followup[index]);

  List<String> instructions = [];
  void addToInstructions(String item) => instructions.add(item);
  void removeFromInstructions(String item) => instructions.remove(item);
  void removeAtIndexFromInstructions(int index) => instructions.removeAt(index);
  void insertAtIndexInInstructions(int index, String item) =>
      instructions.insert(index, item);
  void updateInstructionsAtIndex(int index, Function(String) updateFn) =>
      instructions[index] = updateFn(instructions[index]);

  List<String> referrals = [];
  void addToReferrals(String item) => referrals.add(item);
  void removeFromReferrals(String item) => referrals.remove(item);
  void removeAtIndexFromReferrals(int index) => referrals.removeAt(index);
  void insertAtIndexInReferrals(int index, String item) =>
      referrals.insert(index, item);
  void updateReferralsAtIndex(int index, Function(String) updateFn) =>
      referrals[index] = updateFn(referrals[index]);

  List<String> goals = [];
  void addToGoals(String item) => goals.add(item);
  void removeFromGoals(String item) => goals.remove(item);
  void removeAtIndexFromGoals(int index) => goals.removeAt(index);
  void insertAtIndexInGoals(int index, String item) =>
      goals.insert(index, item);
  void updateGoalsAtIndex(int index, Function(String) updateFn) =>
      goals[index] = updateFn(goals[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for inputgoal widget.
  FocusNode? inputgoalFocusNode;
  TextEditingController? inputgoalTextController;
  String? Function(BuildContext, String?)? inputgoalTextControllerValidator;
  // State field(s) for inputproced widget.
  FocusNode? inputprocedFocusNode;
  TextEditingController? inputprocedTextController;
  String? Function(BuildContext, String?)? inputprocedTextControllerValidator;
  // State field(s) for inputmodif widget.
  FocusNode? inputmodifFocusNode;
  TextEditingController? inputmodifTextController;
  String? Function(BuildContext, String?)? inputmodifTextControllerValidator;
  // State field(s) for inputfollow widget.
  FocusNode? inputfollowFocusNode;
  TextEditingController? inputfollowTextController;
  String? Function(BuildContext, String?)? inputfollowTextControllerValidator;
  // State field(s) for inputinstruct widget.
  FocusNode? inputinstructFocusNode;
  TextEditingController? inputinstructTextController;
  String? Function(BuildContext, String?)? inputinstructTextControllerValidator;
  // State field(s) for inputref widget.
  FocusNode? inputrefFocusNode;
  TextEditingController? inputrefTextController;
  String? Function(BuildContext, String?)? inputrefTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    inputgoalFocusNode?.dispose();
    inputgoalTextController?.dispose();

    inputprocedFocusNode?.dispose();
    inputprocedTextController?.dispose();

    inputmodifFocusNode?.dispose();
    inputmodifTextController?.dispose();

    inputfollowFocusNode?.dispose();
    inputfollowTextController?.dispose();

    inputinstructFocusNode?.dispose();
    inputinstructTextController?.dispose();

    inputrefFocusNode?.dispose();
    inputrefTextController?.dispose();
  }
}
