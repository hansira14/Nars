import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'input_kardex_widget.dart' show InputKardexWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputKardexModel extends FlutterFlowModel<InputKardexWidget> {
  ///  Local state fields for this page.

  List<NotesStruct> notes = [];
  void addToNotes(NotesStruct item) => notes.add(item);
  void removeFromNotes(NotesStruct item) => notes.remove(item);
  void removeAtIndexFromNotes(int index) => notes.removeAt(index);
  void insertAtIndexInNotes(int index, NotesStruct item) =>
      notes.insert(index, item);
  void updateNotesAtIndex(int index, Function(NotesStruct) updateFn) =>
      notes[index] = updateFn(notes[index]);

  int count = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for inputtype widget.
  String? inputtypeValue;
  FormFieldController<String>? inputtypeValueController;
  // State field(s) for inputnote widget.
  FocusNode? inputnoteFocusNode;
  TextEditingController? inputnoteTextController;
  String? Function(BuildContext, String?)? inputnoteTextControllerValidator;
  // Stores action output result for [Custom Action - getNurseList] action in Button widget.
  List<DocumentReference>? nurselist;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    inputnoteFocusNode?.dispose();
    inputnoteTextController?.dispose();
  }
}
