import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/kardex_card/kardex_card_widget.dart';
import '/doctor/doc_nav/doc_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dashboard_doctor_widget.dart' show DashboardDoctorWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardDoctorModel extends FlutterFlowModel<DashboardDoctorWidget> {
  ///  Local state fields for this page.

  String? search;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Algolia Search Results from action on search
  List<PatientRecord>? algoliaSearchResults = [];
  // Model for docNav component.
  late DocNavModel docNavModel;

  @override
  void initState(BuildContext context) {
    docNavModel = createModel(context, () => DocNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    docNavModel.dispose();
  }
}
