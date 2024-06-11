import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'progress_notes_widget.dart' show ProgressNotesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProgressNotesModel extends FlutterFlowModel<ProgressNotesWidget> {
  ///  Local state fields for this component.

  List<String> notes = [];
  void addToNotes(String item) => notes.add(item);
  void removeFromNotes(String item) => notes.remove(item);
  void removeAtIndexFromNotes(int index) => notes.removeAt(index);
  void insertAtIndexInNotes(int index, String item) =>
      notes.insert(index, item);
  void updateNotesAtIndex(int index, Function(String) updateFn) =>
      notes[index] = updateFn(notes[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for inputnote widget.
  FocusNode? inputnoteFocusNode;
  TextEditingController? inputnoteTextController;
  String? Function(BuildContext, String?)? inputnoteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputnoteFocusNode?.dispose();
    inputnoteTextController?.dispose();
  }
}
