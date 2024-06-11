import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/nurse/nurse_navbar/nurse_navbar_widget.dart';
import 'acc_profile_widget.dart' show AccProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccProfileModel extends FlutterFlowModel<AccProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for nurseNavbar component.
  late NurseNavbarModel nurseNavbarModel;

  @override
  void initState(BuildContext context) {
    nurseNavbarModel = createModel(context, () => NurseNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nurseNavbarModel.dispose();
  }
}
