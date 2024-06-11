import '/admin/navbar_admin/navbar_admin_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_usermanagement_widget.dart' show AdminUsermanagementWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminUsermanagementModel
    extends FlutterFlowModel<AdminUsermanagementWidget> {
  ///  Local state fields for this page.

  String? docsearch;

  String? nursesearch;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for search widget.
  FocusNode? searchFocusNode1;
  TextEditingController? searchTextController1;
  String? Function(BuildContext, String?)? searchTextController1Validator;
  // State field(s) for search widget.
  FocusNode? searchFocusNode2;
  TextEditingController? searchTextController2;
  String? Function(BuildContext, String?)? searchTextController2Validator;
  // Model for navbarAdmin component.
  late NavbarAdminModel navbarAdminModel;

  @override
  void initState(BuildContext context) {
    navbarAdminModel = createModel(context, () => NavbarAdminModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    searchFocusNode1?.dispose();
    searchTextController1?.dispose();

    searchFocusNode2?.dispose();
    searchTextController2?.dispose();

    navbarAdminModel.dispose();
  }
}
