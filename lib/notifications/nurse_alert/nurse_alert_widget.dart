import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nurse_alert_model.dart';
export 'nurse_alert_model.dart';

class NurseAlertWidget extends StatefulWidget {
  const NurseAlertWidget({
    super.key,
    required this.notif,
  });

  final NotificationsRecord? notif;

  @override
  State<NurseAlertWidget> createState() => _NurseAlertWidgetState();
}

class _NurseAlertWidgetState extends State<NurseAlertWidget> {
  late NurseAlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NurseAlertModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PatientRecord>(
      stream: PatientRecord.getDocument(widget.notif!.patienref!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitChasingDots(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        final containerPatientRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 85.0,
          decoration: BoxDecoration(
            color: widget.notif!.read ? Color(0xFF4B2C2C) : Color(0xFFFF0000),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.report_problem_rounded,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 40.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nurse Alert',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    containerPatientRecord.department,
                                    '?',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFFAFF8C),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    containerPatientRecord.wardroom,
                                    '?',
                                  ),
                                  style: TextStyle(
                                    color: Color(0xFFFAFF8C),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    containerPatientRecord.lname,
                                    '?',
                                  ),
                                  style: TextStyle(
                                    color: Color(0xFFFAFF8C),
                                    fontSize: 12.0,
                                  ),
                                ),
                                TextSpan(
                                  text: ', ',
                                  style: TextStyle(
                                    color: Color(0xFFFAFF8C),
                                    fontSize: 12.0,
                                  ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    containerPatientRecord.fname,
                                    '?',
                                  ),
                                  style: TextStyle(
                                    color: Color(0xFFFAFF8C),
                                    fontSize: 12.0,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      dateTimeFormat('jm', widget.notif!.timestamp!),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
