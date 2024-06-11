import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_admin_model.dart';
export 'navbar_admin_model.dart';

class NavbarAdminWidget extends StatefulWidget {
  const NavbarAdminWidget({super.key});

  @override
  State<NavbarAdminWidget> createState() => _NavbarAdminWidgetState();
}

class _NavbarAdminWidgetState extends State<NavbarAdminWidget> {
  late NavbarAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarAdminModel());

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
              context.pushNamed('DashboardAdmin');
            },
            child: Icon(
              Icons.dashboard_rounded,
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
              context.pushNamed('Admin_Usermanagement');
            },
            child: Icon(
              Icons.supervised_user_circle_sharp,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Admin_Lab');
              },
              child: FaIcon(
                FontAwesomeIcons.solidFileAlt,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
