import '/admin/admin_add/admin_add_widget.dart';
import '/admin/admin_approve/admin_approve_widget.dart';
import '/admin/input_dept/input_dept_widget.dart';
import '/admin/navbar_admin/navbar_admin_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_admin_widget.dart' show DashboardAdminWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardAdminModel extends FlutterFlowModel<DashboardAdminWidget> {
  ///  Local state fields for this page.

  InsightsoverallStruct? insights;
  void updateInsightsStruct(Function(InsightsoverallStruct) updateFn) =>
      updateFn(insights ??= InsightsoverallStruct());

  List<int> insightcount = [];
  void addToInsightcount(int item) => insightcount.add(item);
  void removeFromInsightcount(int item) => insightcount.remove(item);
  void removeAtIndexFromInsightcount(int index) => insightcount.removeAt(index);
  void insertAtIndexInInsightcount(int index, int item) =>
      insightcount.insert(index, item);
  void updateInsightcountAtIndex(int index, Function(int) updateFn) =>
      insightcount[index] = updateFn(insightcount[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in DashboardAdmin widget.
  int? all;
  // Stores action output result for [Firestore Query - Query a collection] action in DashboardAdmin widget.
  int? newp;
  // Stores action output result for [Firestore Query - Query a collection] action in DashboardAdmin widget.
  int? old;
  // Model for navbarAdmin component.
  late NavbarAdminModel navbarAdminModel;

  @override
  void initState(BuildContext context) {
    navbarAdminModel = createModel(context, () => NavbarAdminModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navbarAdminModel.dispose();
  }
}
