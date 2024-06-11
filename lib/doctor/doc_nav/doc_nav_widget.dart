import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doc_nav_model.dart';
export 'doc_nav_model.dart';

class DocNavWidget extends StatefulWidget {
  const DocNavWidget({super.key});

  @override
  State<DocNavWidget> createState() => _DocNavWidgetState();
}

class _DocNavWidgetState extends State<DocNavWidget> {
  late DocNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocNavModel());

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
              context.pushNamed('DashboardDoctor');
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
        ],
      ),
    );
  }
}
