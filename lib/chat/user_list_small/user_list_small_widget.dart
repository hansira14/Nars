import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_list_small_model.dart';
export 'user_list_small_model.dart';

class UserListSmallWidget extends StatefulWidget {
  const UserListSmallWidget({
    super.key,
    this.userRef,
    this.action,
  });

  final UsersRecord? userRef;
  final Future Function()? action;

  @override
  State<UserListSmallWidget> createState() => _UserListSmallWidgetState();
}

class _UserListSmallWidgetState extends State<UserListSmallWidget> {
  late UserListSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _model.iuserHovered!
              ? FlutterFlowTheme.of(context).primaryBackground
              : FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.userRef?.photoUrl,
                      'https://firebasestorage.googleapis.com/v0/b/nars-02bnoj.appspot.com/o/nursing_tools-_new_grads.jpg?alt=media&token=7bb9346d-dfed-4d98-b72b-1c6b2811d5aa',
                    ),
                    width: 32.0,
                    height: 32.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.userRef?.displayName,
                          'Ghost User',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.userRef?.role,
                            '--',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (currentUserReference == widget.userRef?.reference)
                Container(
                  height: 32.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).tertiary,
                      width: 2.0,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Text(
                        'ME',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      onEnter: ((event) async {
        setState(() => _model.iuserHovered = true);
      }),
      onExit: ((event) async {
        setState(() => _model.iuserHovered = false);
      }),
    );
  }
}
