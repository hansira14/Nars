import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'acc_home_model.dart';
export 'acc_home_model.dart';

class AccHomeWidget extends StatefulWidget {
  const AccHomeWidget({super.key});

  @override
  State<AccHomeWidget> createState() => _AccHomeWidgetState();
}

class _AccHomeWidgetState extends State<AccHomeWidget> {
  late AccHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccHomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.accStatus, 0) == 1) {
        if (valueOrDefault<bool>(currentUserDocument?.completedSetup, false)) {
          if (valueOrDefault(currentUserDocument?.role, '') == 'Admin') {
            context.pushNamed('DashboardAdmin');
          } else if (valueOrDefault(currentUserDocument?.role, '') == 'Nurse') {
            if ((valueOrDefault(currentUserDocument?.department, '') != null &&
                    valueOrDefault(currentUserDocument?.department, '') !=
                        '') &&
                (valueOrDefault(currentUserDocument?.shift, '') != null &&
                    valueOrDefault(currentUserDocument?.shift, '') != '')) {
              context.pushNamed('DashboardNurse');
            }
          } else if (valueOrDefault(currentUserDocument?.role, '') ==
              'Doctor') {
            context.pushNamed('DashboardDoctor');
          } else if (valueOrDefault(currentUserDocument?.role, '') ==
              'Patient') {
            context.pushNamed('DashboardPatient');
          }
        } else {
          context.goNamed('Acc_createprofile');
        }
      }
    });

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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset(
                  'assets/lottie_animations/Animation_-_1713959369802.json',
                  width: 150.0,
                  height: 340.0,
                  fit: BoxFit.cover,
                  animate: true,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('Acc_Login', context.mounted);
                  },
                  child: Text(
                    'Access denied',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                        ),
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
