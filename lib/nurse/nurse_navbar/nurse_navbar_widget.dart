import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nurse_navbar_model.dart';
export 'nurse_navbar_model.dart';

class NurseNavbarWidget extends StatefulWidget {
  const NurseNavbarWidget({super.key});

  @override
  State<NurseNavbarWidget> createState() => _NurseNavbarWidgetState();
}

class _NurseNavbarWidgetState extends State<NurseNavbarWidget> {
  late NurseNavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NurseNavbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('DashboardNurse');
            },
            child: Icon(
              FFIcons.kvector2,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 23.0,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('Patients');
            },
            child: Icon(
              FFIcons.kvector3,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('chat_all');
            },
            child: Icon(
              FFIcons.ktambal,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 31.0,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('Acc_Profile');
            },
            child: Container(
              width: 31.0,
              height: 31.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  width: 3.0,
                ),
              ),
              child: AuthUserStreamWidget(
                builder: (context) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      currentUserPhoto,
                      'https://firebasestorage.googleapis.com/v0/b/nars-02bnoj.appspot.com/o/nursing_tools-_new_grads.jpg?alt=media&token=7bb9346d-dfed-4d98-b72b-1c6b2811d5aa',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
