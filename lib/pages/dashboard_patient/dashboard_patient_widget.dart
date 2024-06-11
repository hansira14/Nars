import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/patient_nav/patient_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_patient_model.dart';
export 'dashboard_patient_model.dart';

class DashboardPatientWidget extends StatefulWidget {
  const DashboardPatientWidget({super.key});

  @override
  State<DashboardPatientWidget> createState() => _DashboardPatientWidgetState();
}

class _DashboardPatientWidgetState extends State<DashboardPatientWidget> {
  late DashboardPatientModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardPatientModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PatientRecord>>(
      stream: queryPatientRecord(
        queryBuilder: (patientRecord) => patientRecord.where(
          'userID',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<PatientRecord> dashboardPatientPatientRecordList = snapshot.data!;
        final dashboardPatientPatientRecord =
            dashboardPatientPatientRecordList.isNotEmpty
                ? dashboardPatientPatientRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Text(
                                  'Welcome,',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 30.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    valueOrDefault(
                                        currentUserDocument?.fname, ''),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                dateTimeFormat('MMMEd', getCurrentTimestamp),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/medical-seamless-pattern-hospital-background-with-vector-icons-health-care-equipment_124013-288.jpg',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 330.0,
                                    height: 330.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 50.0,
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onDoubleTap: () async {
                                        if (!(_model.emergency?.read != null)) {
                                          triggerPushNotification(
                                            notificationTitle: 'Emergency',
                                            notificationText:
                                                '${dashboardPatientPatientRecord?.fname} ${dashboardPatientPatientRecord?.lname}needs assitance! ${dashboardPatientPatientRecord?.department}${dashboardPatientPatientRecord?.wardroom}',
                                            notificationImageUrl:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/nars-02bnoj/assets/edet43qtsvz2/nars._(1).png',
                                            notificationSound: 'default',
                                            userRefs: [
                                              functions.getNurseRecipient(
                                                  dashboardPatientPatientRecord!
                                                      .nurse1!,
                                                  dashboardPatientPatientRecord!
                                                      .nurse2!,
                                                  dashboardPatientPatientRecord!
                                                      .nurse3!,
                                                  getCurrentTimestamp)
                                            ],
                                            initialPageName: 'DashboardNurse',
                                            parameterData: {},
                                          );

                                          var notificationsRecordReference =
                                              NotificationsRecord.collection
                                                  .doc();
                                          await notificationsRecordReference
                                              .set(
                                                  createNotificationsRecordData(
                                            recipient: functions.getNurseRecipient(
                                                dashboardPatientPatientRecord!
                                                    .nurse1!,
                                                dashboardPatientPatientRecord!
                                                    .nurse2!,
                                                dashboardPatientPatientRecord!
                                                    .nurse3!,
                                                getCurrentTimestamp),
                                            timestamp: getCurrentTimestamp,
                                            read: false,
                                            patienref:
                                                dashboardPatientPatientRecord
                                                    ?.reference,
                                            type: 3,
                                          ));
                                          _model.emergency = NotificationsRecord
                                              .getDocumentFromData(
                                                  createNotificationsRecordData(
                                                    recipient: functions.getNurseRecipient(
                                                        dashboardPatientPatientRecord!
                                                            .nurse1!,
                                                        dashboardPatientPatientRecord!
                                                            .nurse2!,
                                                        dashboardPatientPatientRecord!
                                                            .nurse3!,
                                                        getCurrentTimestamp),
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    read: false,
                                                    patienref:
                                                        dashboardPatientPatientRecord
                                                            ?.reference,
                                                    type: 3,
                                                  ),
                                                  notificationsRecordReference);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Emergency Alert Successful',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        }

                                        setState(() {});
                                      },
                                      child: Icon(
                                        FFIcons.ktambal,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 140.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'Tap 2 times to call your Nurse',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'We\'re dedicated to your comfort and safety during your stay. Feel free to reach out for any assistance or concerns.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.goNamedAuth(
                                            'Acc_Login', context.mounted);
                                      },
                                      child: Text(
                                        'Logout',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
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
                          ],
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.patientNavModel,
                      updateCallback: () => setState(() {}),
                      child: PatientNavWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
