import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirm_lab_widget.dart';
import '/components/labs_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nurse_labs_model.dart';
export 'nurse_labs_model.dart';

class NurseLabsWidget extends StatefulWidget {
  const NurseLabsWidget({super.key});

  @override
  State<NurseLabsWidget> createState() => _NurseLabsWidgetState();
}

class _NurseLabsWidgetState extends State<NurseLabsWidget> {
  late NurseLabsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NurseLabsModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: Text(
                'Labtests',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Flexible(
              child: StreamBuilder<List<LabtestsRecord>>(
                stream: queryLabtestsRecord(
                  queryBuilder: (labtestsRecord) => labtestsRecord
                      .where(
                        'nurses',
                        arrayContains: currentUserReference,
                      )
                      .where(
                        'fetched',
                        isEqualTo: false,
                      )
                      .orderBy('date', descending: true),
                ),
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
                  List<LabtestsRecord> listViewLabtestsRecordList =
                      snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewLabtestsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewLabtestsRecord =
                          listViewLabtestsRecordList[listViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (!listViewLabtestsRecord.fetched) {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ConfirmLabWidget(
                                      lab: listViewLabtestsRecord,
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          },
                          child: LabsWidget(
                            key: Key(
                                'Keyt7c_${listViewIndex}_of_${listViewLabtestsRecordList.length}'),
                            labs: listViewLabtestsRecord,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Close',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).border,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
