import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kardex_card_model.dart';
export 'kardex_card_model.dart';

class KardexCardWidget extends StatefulWidget {
  const KardexCardWidget({
    super.key,
    required this.patient,
  });

  final PatientRecord? patient;

  @override
  State<KardexCardWidget> createState() => _KardexCardWidgetState();
}

class _KardexCardWidgetState extends State<KardexCardWidget> {
  late KardexCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KardexCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.patient?.carelevel == 1) {
        _model.carelevel = Color(0xFF66B159);
        setState(() {});
      } else if (widget.patient?.carelevel == 2) {
        _model.carelevel = Color(0xFF699BF7);
        setState(() {});
      } else if (widget.patient?.carelevel == 3) {
        _model.carelevel = Color(0xFFFFEA31);
        setState(() {});
      } else if (widget.patient?.carelevel == 4) {
        _model.carelevel = Color(0xFFFF814B);
        setState(() {});
      } else if (widget.patient?.carelevel == 5) {
        _model.carelevel = Color(0xFFFF4C4C);
        setState(() {});
      }
    });

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
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).light,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 95.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: _model.carelevel,
              borderRadius: BorderRadius.circular(15.0),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 11.0, 8.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.patient?.department,
                      '??',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.patient?.wardroom,
                      '???',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 38.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.1,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: valueOrDefault<String>(
                            widget.patient?.lname,
                            '?',
                          ),
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                        TextSpan(
                          text: ', ',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: valueOrDefault<String>(
                            widget.patient?.fname,
                            '?',
                          ),
                          style: TextStyle(),
                        )
                      ],
                      style: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            widget.patient?.gender,
                                            'n/a',
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ', ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            functions
                                                .getAge(widget.patient!.dob!)
                                                .toString(),
                                            '??',
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: ' yo.',
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  if (widget.patient?.hasDoctor() ?? true)
                                    StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          widget.patient!.doctor!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        final doctorUsersRecord =
                                            snapshot.data!;
                                        return Text(
                                          valueOrDefault<String>(
                                            doctorUsersRecord.displayName,
                                            '???',
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                            height: 1.0,
                                          ),
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Icon(
                                    Icons.water_drop,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 18.0,
                                  ),
                                ),
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Type ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.patient?.blood,
                                          'n/a',
                                        ),
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Icon(
                                    FFIcons.kmeds,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 15.0,
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.patient!.diagnoses.length > 0
                                        ? valueOrDefault<String>(
                                            widget.patient?.diagnoses?.first,
                                            'n/a',
                                          )
                                        : '???',
                                    '???',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
