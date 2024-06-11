import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'input_doctorsorder_widget.dart' show InputDoctorsorderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputDoctorsorderModel extends FlutterFlowModel<InputDoctorsorderWidget> {
  ///  Local state fields for this page.

  List<String> notes = [];
  void addToNotes(String item) => notes.add(item);
  void removeFromNotes(String item) => notes.remove(item);
  void removeAtIndexFromNotes(int index) => notes.removeAt(index);
  void insertAtIndexInNotes(int index, String item) =>
      notes.insert(index, item);
  void updateNotesAtIndex(int index, Function(String) updateFn) =>
      notes[index] = updateFn(notes[index]);

  int count = 0;

  List<DocumentReference> nurses = [];
  void addToNurses(DocumentReference item) => nurses.add(item);
  void removeFromNurses(DocumentReference item) => nurses.remove(item);
  void removeAtIndexFromNurses(int index) => nurses.removeAt(index);
  void insertAtIndexInNurses(int index, DocumentReference item) =>
      nurses.insert(index, item);
  void updateNursesAtIndex(int index, Function(DocumentReference) updateFn) =>
      nurses[index] = updateFn(nurses[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for inputnote widget.
  FocusNode? inputnoteFocusNode;
  TextEditingController? inputnoteTextController;
  String? Function(BuildContext, String?)? inputnoteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    inputnoteFocusNode?.dispose();
    inputnoteTextController?.dispose();
  }
}
