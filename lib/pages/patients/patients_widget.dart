import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/kardex_card/kardex_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'patients_model.dart';
export 'patients_model.dart';

class PatientsWidget extends StatefulWidget {
  const PatientsWidget({
    super.key,
    this.searchparam,
  });

  final String? searchparam;

  @override
  State<PatientsWidget> createState() => _PatientsWidgetState();
}

class _PatientsWidgetState extends State<PatientsWidget> {
  late PatientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.searchparam != null && widget.searchparam != '') {
        _model.search = widget.searchparam;
        setState(() {});
      }
    });

    _model.searchTextController ??=
        TextEditingController(text: widget.searchparam);
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 26.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                      Text(
                        'Patients',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
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
                        autofocus: true,
                        textInputAction: TextInputAction.search,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: false,
                          hintText: 'Search Patient',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          suffixIcon: Icon(
                            Icons.filter_list_sharp,
                            size: 20.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                        textAlign: TextAlign.start,
                        minLines: 1,
                        validator: _model.searchTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          valueOrDefault<String>(
                            valueOrDefault(currentUserDocument?.department, ''),
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
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (_model.search == null || _model.search == '') {
                        return StreamBuilder<List<PatientRecord>>(
                          stream: queryPatientRecord(
                            queryBuilder: (patientRecord) =>
                                patientRecord.where(Filter.or(
                              Filter(
                                'nurse1',
                                isEqualTo: currentUserReference,
                              ),
                              Filter(
                                'nurse2',
                                isEqualTo: currentUserReference,
                              ),
                              Filter(
                                'nurse3',
                                isEqualTo: currentUserReference,
                              ),
                            )),
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
                            List<PatientRecord> listViewPatientRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewPatientRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewPatientRecord =
                                    listViewPatientRecordList[listViewIndex];
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
                                          'Keymly_${listViewIndex}_of_${listViewPatientRecordList.length}'),
                                      patient: listViewPatientRecord,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else {
                        return Builder(
                          builder: (context) {
                            if (_model.algoliaSearchResults
                                    ?.where((e) =>
                                        (e.nurse1 == currentUserReference) ||
                                        (e.nurse2 == currentUserReference) ||
                                        (e.nurse3 == currentUserReference))
                                    .toList() ==
                                null) {
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
                            final results = _model.algoliaSearchResults
                                    ?.where((e) =>
                                        (e.nurse1 == currentUserReference) ||
                                        (e.nurse2 == currentUserReference) ||
                                        (e.nurse3 == currentUserReference))
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
                                      0.0, 0.0, 0.0, 8.0),
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
                                          'Keysqh_${resultsIndex}_of_${results.length}'),
                                      patient: resultsItem,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
