import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'nonotifs_model.dart';
export 'nonotifs_model.dart';

class NonotifsWidget extends StatefulWidget {
  const NonotifsWidget({super.key});

  @override
  State<NonotifsWidget> createState() => _NonotifsWidgetState();
}

class _NonotifsWidgetState extends State<NonotifsWidget> {
  late NonotifsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NonotifsModel());

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Lottie.asset(
            'assets/lottie_animations/Animation_-_1715347523894.json',
            width: 150.0,
            height: 130.0,
            fit: BoxFit.cover,
            animate: true,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Text(
            'You\'re all caught up',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Text(
          'No notifications yet',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
