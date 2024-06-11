import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'med_notifs_model.dart';
export 'med_notifs_model.dart';

class MedNotifsWidget extends StatefulWidget {
  const MedNotifsWidget({
    super.key,
    required this.notif,
  });

  final NotificationsRecord? notif;

  @override
  State<MedNotifsWidget> createState() => _MedNotifsWidgetState();
}

class _MedNotifsWidgetState extends State<MedNotifsWidget> {
  late MedNotifsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedNotifsModel());

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
          height: 80.0,
          decoration: BoxDecoration(
            color: Color(0xFFF1F6FF),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: widget.notif!.read
                  ? Color(0x00000000)
                  : FlutterFlowTheme.of(context).primary,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.medication_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 60.0,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.notif?.title,
                            '???',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
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
                                  '???',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.w500,
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
                                  fontSize: 12.0,
                                ),
                              ),
                              TextSpan(
                                text: ', ',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              TextSpan(
                                text: valueOrDefault<String>(
                                  containerPatientRecord.fname,
                                  '?',
                                ),
                                style: TextStyle(
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
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            dateTimeFormat('jm', widget.notif!.timestamp!),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Container(
                        width: 80.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.notif?.content,
                              'Dose',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
