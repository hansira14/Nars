import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nurse_notes_model.dart';
export 'nurse_notes_model.dart';

class NurseNotesWidget extends StatefulWidget {
  const NurseNotesWidget({
    super.key,
    required this.note,
  });

  final KardexRecord? note;

  @override
  State<NurseNotesWidget> createState() => _NurseNotesWidgetState();
}

class _NurseNotesWidgetState extends State<NurseNotesWidget> {
  late NurseNotesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NurseNotesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                    child: Checkbox(
                      value: _model.checkboxValue ??= widget.note!.isCompleted,
                      onChanged: (newValue) async {
                        setState(() => _model.checkboxValue = newValue!);
                        if (newValue!) {
                          await widget.note!.reference
                              .update(createKardexRecordData(
                            isCompleted: true,
                          ));
                        } else {
                          await widget.note!.reference
                              .update(createKardexRecordData(
                            isCompleted: false,
                          ));
                        }
                      },
                      side: BorderSide(
                        width: 2,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                  if (widget.note?.isLab == true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent2,
                        ),
                        child: Icon(
                          FFIcons.kvector2,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 17.0,
                        ),
                      ),
                    ),
                  Text(
                    valueOrDefault<String>(
                      widget.note?.note,
                      '???',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto Flex',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Delete Note'),
                            content: Text('Are you sure?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Yes'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    await widget.note!.reference.delete();
                  }
                },
                child: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.0,
          indent: 40.0,
          endIndent: 25.0,
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ],
    );
  }
}
