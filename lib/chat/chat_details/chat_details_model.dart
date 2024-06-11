import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/chat_component/chat_component_widget.dart';
import '/chat/chat_menu/chat_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'chat_details_widget.dart' show ChatDetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatDetailsModel extends FlutterFlowModel<ChatDetailsWidget> {
  ///  Local state fields for this page.

  List<String> uploadedImages = [];
  void addToUploadedImages(String item) => uploadedImages.add(item);
  void removeFromUploadedImages(String item) => uploadedImages.remove(item);
  void removeAtIndexFromUploadedImages(int index) =>
      uploadedImages.removeAt(index);
  void insertAtIndexInUploadedImages(int index, String item) =>
      uploadedImages.insert(index, item);
  void updateUploadedImagesAtIndex(int index, Function(String) updateFn) =>
      uploadedImages[index] = updateFn(uploadedImages[index]);

  List<DocumentReference> lastMessageSeenBy = [];
  void addToLastMessageSeenBy(DocumentReference item) =>
      lastMessageSeenBy.add(item);
  void removeFromLastMessageSeenBy(DocumentReference item) =>
      lastMessageSeenBy.remove(item);
  void removeAtIndexFromLastMessageSeenBy(int index) =>
      lastMessageSeenBy.removeAt(index);
  void insertAtIndexInLastMessageSeenBy(int index, DocumentReference item) =>
      lastMessageSeenBy.insert(index, item);
  void updateLastMessageSeenByAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      lastMessageSeenBy[index] = updateFn(lastMessageSeenBy[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for chat_component component.
  late ChatComponentModel chatComponentModel;

  @override
  void initState(BuildContext context) {
    chatComponentModel = createModel(context, () => ChatComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    chatComponentModel.dispose();
  }
}
