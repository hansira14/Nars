import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/icu/icu_widget.dart';
import '/components/room/room_widget.dart';
import '/components/ward/ward_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'input_dept_widget.dart' show InputDeptWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputDeptModel extends FlutterFlowModel<InputDeptWidget> {
  ///  Local state fields for this component.

  String dept = 'Ward';

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for WARD component.
  late WardModel wardModel;
  // Model for ICU component.
  late IcuModel icuModel;
  // Model for ROOM component.
  late RoomModel roomModel;

  @override
  void initState(BuildContext context) {
    wardModel = createModel(context, () => WardModel());
    icuModel = createModel(context, () => IcuModel());
    roomModel = createModel(context, () => RoomModel());
  }

  @override
  void dispose() {
    wardModel.dispose();
    icuModel.dispose();
    roomModel.dispose();
  }
}
