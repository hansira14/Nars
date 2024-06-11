import '/backend/backend.dart';
import '/components/kardex_card/kardex_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_patient_model.dart';
export 'choose_patient_model.dart';

class ChoosePatientWidget extends StatefulWidget {
  const ChoosePatientWidget({super.key});

  @override
  State<ChoosePatientWidget> createState() => _ChoosePatientWidgetState();
}

class _ChoosePatientWidgetState extends State<ChoosePatientWidget> {
  late ChoosePatientModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoosePatientModel());

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).light,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                        safeSetState(() => _model.algoliaSearchResults = null);
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
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (_model.search == null || _model.search == '') {
                        return FutureBuilder<List<PatientRecord>>(
                          future: queryPatientRecordOnce(
                            queryBuilder: (patientRecord) =>
                                patientRecord.where(
                              'discharged',
                              isEqualTo: false,
                            ),
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
                                      Navigator.pop(
                                          context, listViewPatientRecord);
                                    },
                                    child: KardexCardWidget(
                                      key: Key(
                                          'Keyepv_${listViewIndex}_of_${listViewPatientRecordList.length}'),
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
                                    ?.where((e) => e.discharged != true)
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
                                    ?.where((e) => e.discharged != true)
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
                                      Navigator.pop(context, resultsItem);
                                    },
                                    child: KardexCardWidget(
                                      key: Key(
                                          'Keyrhb_${resultsIndex}_of_${results.length}'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
