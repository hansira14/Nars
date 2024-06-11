import '/backend/backend.dart';
import '/components/kardex_card/kardex_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_patient_widget.dart' show ChoosePatientWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChoosePatientModel extends FlutterFlowModel<ChoosePatientWidget> {
  ///  Local state fields for this component.

  String? search;

  ///  State fields for stateful widgets in this component.

  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Algolia Search Results from action on search
  List<PatientRecord>? algoliaSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
