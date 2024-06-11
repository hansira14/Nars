import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'patient_nav_model.dart';
export 'patient_nav_model.dart';

class PatientNavWidget extends StatefulWidget {
  const PatientNavWidget({super.key});

  @override
  State<PatientNavWidget> createState() => _PatientNavWidgetState();
}

class _PatientNavWidgetState extends State<PatientNavWidget> {
  late PatientNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientNavModel());

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
              context.pushNamed('DashboardPatient');
            },
            child: Icon(
              FFIcons.kvector2,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 25.0,
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
              size: 35.0,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.patient = await queryPatientRecordOnce(
                queryBuilder: (patientRecord) => patientRecord.where(
                  'userID',
                  isEqualTo: currentUserReference,
                ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);

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
            child: Icon(
              FFIcons.kicu,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
