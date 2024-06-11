import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/kardex_card/kardex_card_widget.dart';
import '/doctor/doc_nav/doc_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_doctor_model.dart';
export 'dashboard_doctor_model.dart';

class DashboardDoctorWidget extends StatefulWidget {
  const DashboardDoctorWidget({super.key});

  @override
  State<DashboardDoctorWidget> createState() => _DashboardDoctorWidgetState();
}

class _DashboardDoctorWidgetState extends State<DashboardDoctorWidget> {
  late DashboardDoctorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardDoctorModel());

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'Acc_Login', context.mounted);
                                },
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Hi ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault(
                                            currentUserDocument?.role, ''),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' ',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault(
                                            currentUserDocument?.fname, ''),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.normal,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 13.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.searchTextController,
                        focusNode: _model.searchFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.searchTextController',
                          Duration(milliseconds: 2000),
                          () async {
                            _model.search = _model.searchTextController.text;
                            setState(() {});
                          },
                        ),
                        onFieldSubmitted: (_) async {
                          safeSetState(
                              () => _model.algoliaSearchResults = null);
                          await PatientRecord.search(
                            term: _model.searchTextController.text,
                          )
                              .then((r) => _model.algoliaSearchResults = r)
                              .onError(
                                  (_, __) => _model.algoliaSearchResults = [])
                              .whenComplete(() => setState(() {}));
                        },
                        autofocus: false,
                        textInputAction: TextInputAction.search,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Search Patient',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          prefixIcon: Icon(
                            Icons.search_sharp,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                        textAlign: TextAlign.start,
                        validator: _model.searchTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Text(
                    'Patients',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (_model.search != null && _model.search != '') {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (_model.algoliaSearchResults
                                        ?.where((e) =>
                                            e.doctor == currentUserReference)
                                        .toList() ==
                                    null) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitChasingDots(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final results = _model.algoliaSearchResults
                                        ?.where((e) =>
                                            e.doctor == currentUserReference)
                                        .toList()
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: results.length,
                                  itemBuilder: (context, resultsIndex) {
                                    final resultsItem = results[resultsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'aboutPatient',
                                            queryParameters: {
                                              'patient': serializeParam(
                                                resultsItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'patient': resultsItem,
                                            },
                                          );
                                        },
                                        child: KardexCardWidget(
                                          key: Key(
                                              'Keyh3z_${resultsIndex}_of_${results.length}'),
                                          patient: resultsItem,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: FutureBuilder<List<PatientRecord>>(
                              future: queryPatientRecordOnce(
                                queryBuilder: (patientRecord) => patientRecord
                                    .where(
                                      'doctor',
                                      isEqualTo: currentUserReference,
                                    )
                                    .orderBy('lname'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitChasingDots(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<PatientRecord> listViewPatientRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewPatientRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewPatientRecord =
                                        listViewPatientRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'aboutPatient',
                                            queryParameters: {
                                              'patient': serializeParam(
                                                listViewPatientRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'patient': listViewPatientRecord,
                                            },
                                          );
                                        },
                                        child: KardexCardWidget(
                                          key: Key(
                                              'Keymes_${listViewIndex}_of_${listViewPatientRecordList.length}'),
                                          patient: listViewPatientRecord,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.docNavModel,
                    updateCallback: () => setState(() {}),
                    child: DocNavWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
