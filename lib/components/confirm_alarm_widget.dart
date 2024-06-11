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
import 'confirm_alarm_model.dart';
export 'confirm_alarm_model.dart';

class ConfirmAlarmWidget extends StatefulWidget {
  const ConfirmAlarmWidget({
    super.key,
    required this.medicine,
  });

  final MedicationsRecord? medicine;

  @override
  State<ConfirmAlarmWidget> createState() => _ConfirmAlarmWidgetState();
}

class _ConfirmAlarmWidgetState extends State<ConfirmAlarmWidget> {
  late ConfirmAlarmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmAlarmModel());

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
                'Confirm medicine intake',
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
                await widget.medicine!.reference.update({
                  ...createMedicationsRecordData(
                    currentSched: functions.nextSched(
                        getCurrentTimestamp, widget.medicine!.frequency),
                  ),
                  ...mapToFirestore(
                    {
                      'intakes': FieldValue.arrayUnion([getCurrentTimestamp]),
                    },
                  ),
                });
                _model.patientref = await PatientRecord.getDocumentOnce(
                    widget.medicine!.parentReference);
                triggerPushNotification(
                  notificationTitle: 'Medication Alert',
                  notificationText: valueOrDefault<String>(
                    '${_model.patientref?.fname} ${_model.patientref?.lname} should now take ${widget.medicine?.medicine}',
                    '???',
                  ),
                  notificationImageUrl:
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/nars-02bnoj/assets/edet43qtsvz2/nars._(1).png',
                  scheduledTime: functions.nextSched(
                      getCurrentTimestamp, widget.medicine!.frequency),
                  userRefs: [
                    functions.getNurseRecipient(
                        _model.patientref!.nurse1!,
                        _model.patientref!.nurse2!,
                        _model.patientref!.nurse3!,
                        functions.nextSched(
                            getCurrentTimestamp, widget.medicine!.frequency))
                  ],
                  initialPageName: 'aboutPatient',
                  parameterData: {
                    'patient': _model.patientref,
                  },
                );

                await NotificationsRecord.collection
                    .doc()
                    .set(createNotificationsRecordData(
                      recipient: functions.getNurseRecipient(
                          _model.patientref!.nurse1!,
                          _model.patientref!.nurse2!,
                          _model.patientref!.nurse3!,
                          functions.nextSched(
                              getCurrentTimestamp, widget.medicine!.frequency)),
                      title: widget.medicine?.medicine,
                      content: valueOrDefault<String>(
                        'Dose ${valueOrDefault<String>(
                          (valueOrDefault<int>(
                                    widget.medicine?.intakes?.length,
                                    0,
                                  ) +
                                  1)
                              .toString(),
                          '0',
                        )}',
                        'Dose',
                      ),
                      timestamp: functions.nextSched(
                          getCurrentTimestamp, widget.medicine!.frequency),
                      read: false,
                      patienref: widget.medicine?.parentReference,
                      type: 2,
                      medicineref: widget.medicine?.reference,
                    ));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'New alarm set on ${functions.nextSched(getCurrentTimestamp, widget.medicine!.frequency).toString()}',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                  ),
                );

                setState(() {});
              },
              text: 'Confirm',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
