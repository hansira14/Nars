import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/kardex_card/kardex_card_widget.dart';
import '/components/nurse_alarms_widget.dart';
import '/components/nurse_labs_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/inputs/add_patient/add_patient_widget.dart';
import '/notifications/emergency/emergency_widget.dart';
import '/nurse/nurse_navbar/nurse_navbar_widget.dart';
import 'dashboard_nurse_widget.dart' show DashboardNurseWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DashboardNurseModel extends FlutterFlowModel<DashboardNurseWidget> {
  ///  Local state fields for this page.

  InsightsStruct? insights;
  void updateInsightsStruct(Function(InsightsStruct) updateFn) =>
      updateFn(insights ??= InsightsStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in DashboardNurse widget.
  NotificationsRecord? emergency;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Model for nurseNavbar component.
  late NurseNavbarModel nurseNavbarModel;

  @override
  void initState(BuildContext context) {
    nurseNavbarModel = createModel(context, () => NurseNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    nurseNavbarModel.dispose();
  }
}
