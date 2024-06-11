import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'visitlogs_model.dart';
export 'visitlogs_model.dart';

class VisitlogsWidget extends StatefulWidget {
  const VisitlogsWidget({
    super.key,
    required this.visitor,
  });

  final VisitorsRecord? visitor;

  @override
  State<VisitlogsWidget> createState() => _VisitlogsWidgetState();
}

class _VisitlogsWidgetState extends State<VisitlogsWidget> {
  late VisitlogsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitlogsModel());

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
      width: 350.0,
      height: 45.0,
      decoration: BoxDecoration(
        color: Color(0xFFDAFFD4),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Container(
                      width: 30.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF0A4700),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(
                        Icons.personal_injury,
                        color: Color(0xFFDAFFD4),
                        size: 24.0,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.visitor?.name,
                            '???',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.visitor?.age?.toString(),
                                  '?',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      lineHeight: 1.0,
                                    ),
                              ),
                              TextSpan(
                                text: ' yo, ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.visitor?.gender,
                                  '?',
                                ),
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: ' - ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.visitor?.relation,
                                  '?',
                                ),
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  lineHeight: 1.0,
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
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                        child: Icon(
                          Icons.calendar_today,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 10.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(200.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            dateTimeFormat('yMd', widget.visitor?.date),
                            '???',
                          ),
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: valueOrDefault<String>(
                              dateTimeFormat('jm', widget.visitor?.date),
                              '???',
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.normal,
                              fontSize: 8.0,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                              lineHeight: 1.0,
                            ),
                      ),
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
