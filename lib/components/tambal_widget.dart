import '/backend/backend.dart';
import '/components/confirm_alarm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tambal_model.dart';
export 'tambal_model.dart';

class TambalWidget extends StatefulWidget {
  const TambalWidget({
    super.key,
    required this.tambal,
  });

  final MedicationsRecord? tambal;

  @override
  State<TambalWidget> createState() => _TambalWidgetState();
}

class _TambalWidgetState extends State<TambalWidget> {
  late TambalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TambalModel());

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
      stream: PatientRecord.getDocument(widget.tambal!.parentReference),
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
        final listContainerPatientRecord = snapshot.data!;
        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (widget.tambal!.currentSched! < getCurrentTimestamp) {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: ConfirmAlarmWidget(
                      medicine: widget.tambal!,
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            }
          },
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 570.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: widget.tambal!.currentSched! < getCurrentTimestamp
                    ? FlutterFlowTheme.of(context).error
                    : FlutterFlowTheme.of(context).border,
                width: 2.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: listContainerPatientRecord.lname,
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: ': ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.tambal?.medicine,
                                  '??',
                                ),
                                style: TextStyle(
                                  color: widget.tambal!.currentSched! <
                                          getCurrentTimestamp
                                      ? FlutterFlowTheme.of(context).error
                                      : FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF15161E),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.tambal?.route,
                                    '??',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF606A85),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                TextSpan(
                                  text: ', ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: widget.tambal!.note,
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF606A85),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Container(
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F4F8),
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xFFE5E7EB),
                                width: 2.0,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 0.0, 7.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.tambal?.dose?.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      TextSpan(
                                        text: ' mg',
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF606A85),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: listContainerPatientRecord.department,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF15161E),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: listContainerPatientRecord.wardroom,
                              style: TextStyle(),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF15161E),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: widget.tambal!.currentSched! <
                                    getCurrentTimestamp
                                ? Color(0x4FFF5963)
                                : Color(0x3B699BF7),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: widget.tambal!.currentSched! <
                                      getCurrentTimestamp
                                  ? FlutterFlowTheme.of(context).error
                                  : FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                      'jm', widget.tambal?.currentSched),
                                  '??',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: widget.tambal!.currentSched! <
                                              getCurrentTimestamp
                                          ? FlutterFlowTheme.of(context).error
                                          : FlutterFlowTheme.of(context)
                                              .primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
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
          ),
        );
      },
    );
  }
}
