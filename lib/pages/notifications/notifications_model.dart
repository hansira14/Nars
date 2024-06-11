import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/confirm_done_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notifications/lab_notifs/lab_notifs_widget.dart';
import '/notifications/med_notifs/med_notifs_widget.dart';
import '/notifications/nurse_alert/nurse_alert_widget.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
