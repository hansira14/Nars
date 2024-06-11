import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_done_model.dart';
export 'confirm_done_model.dart';

class ConfirmDoneWidget extends StatefulWidget {
  const ConfirmDoneWidget({
    super.key,
    required this.notif,
  });

  final NotificationsRecord? notif;

  @override
  State<ConfirmDoneWidget> createState() => _ConfirmDoneWidgetState();
}

class _ConfirmDoneWidgetState extends State<ConfirmDoneWidget> {
  late ConfirmDoneModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmDoneModel());

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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Text(
                'Mark as accomplished?',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                _model.patient = await PatientRecord.getDocumentOnce(
                    widget.notif!.patienref!);

                context.pushNamed(
                  'aboutPatient',
                  queryParameters: {
                    'patient': serializeParam(
                      _model.patient,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'patient': _model.patient,
                  },
                );

                setState(() {});
              },
              text: 'View Patient',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).error,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).info,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (widget.notif?.type == 1) {
                    await widget.notif!.labref!.update(createLabtestsRecordData(
                      fetched: true,
                    ));
                  } else if (widget.notif?.type == 2) {
                    _model.medicine = await MedicationsRecord.getDocumentOnce(
                        widget.notif!.medicineref!);

                    await widget.notif!.medicineref!.update({
                      ...createMedicationsRecordData(
                        currentSched: functions.nextSched(
                            getCurrentTimestamp, _model.medicine!.frequency),
                      ),
                      ...mapToFirestore(
                        {
                          'intakes':
                              FieldValue.arrayUnion([getCurrentTimestamp]),
                        },
                      ),
                    });
                    _model.patientref = await PatientRecord.getDocumentOnce(
                        widget.notif!.patienref!);
                    triggerPushNotification(
                      notificationTitle: 'Medication Alert',
                      notificationText: valueOrDefault<String>(
                        '${_model.patientref?.lname} ${_model.patientref?.fname} should now take ${_model.medicine?.medicine}',
                        '???',
                      ),
                      notificationImageUrl:
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/nars-02bnoj/assets/edet43qtsvz2/nars._(1).png',
                      scheduledTime: functions.nextSched(
                          getCurrentTimestamp, _model.medicine!.frequency),
                      notificationSound: 'default',
                      userRefs: [
                        functions.getNurseRecipient(
                            _model.patientref!.nurse1!,
                            _model.patientref!.nurse2!,
                            _model.patientref!.nurse3!,
                            functions.nextSched(getCurrentTimestamp,
                                _model.medicine!.frequency))
                      ],
                      initialPageName: 'Notifications',
                      parameterData: {},
                    );

                    await NotificationsRecord.collection
                        .doc()
                        .set(createNotificationsRecordData(
                          recipient: functions.getNurseRecipient(
                              _model.patientref!.nurse1!,
                              _model.patientref!.nurse2!,
                              _model.patientref!.nurse3!,
                              functions.nextSched(getCurrentTimestamp,
                                  _model.medicine!.frequency)),
                          title: _model.medicine?.medicine,
                          content: valueOrDefault<String>(
                            'Dose ${valueOrDefault<String>(
                              (valueOrDefault<int>(
                                        _model.medicine?.intakes?.length,
                                        0,
                                      ) +
                                      1)
                                  .toString(),
                              '0',
                            )}',
                            'Dose',
                          ),
                          timestamp: functions.nextSched(
                              getCurrentTimestamp, _model.medicine!.frequency),
                          read: false,
                          patienref: widget.notif?.patienref,
                          type: 2,
                          medicineref: widget.notif?.medicineref,
                        ));
                  }

                  await widget.notif!.reference
                      .update(createNotificationsRecordData(
                    read: true,
                  ));
                  Navigator.pop(context);

                  setState(() {});
                },
                text: 'Yes',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pop();
                },
                text: 'Cancel',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF57636C),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
