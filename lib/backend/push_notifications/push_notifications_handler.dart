import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitChasingDots(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Acc_Login': ParameterData.none(),
  'DashboardNurse': ParameterData.none(),
  'chat_details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chat_all': ParameterData.none(),
  'chat_invite': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'Kardex': ParameterData.none(),
  'Acc_Home': ParameterData.none(),
  'Acc_createprofile': ParameterData.none(),
  'KardexView': (data) async => ParameterData(
        allParams: {
          'patientref': await getDocumentParameter<PatientRecord>(
              data, 'patientref', PatientRecord.fromSnapshot),
        },
      ),
  'input_Kardex': (data) async => ParameterData(
        allParams: {
          'patientref': await getDocumentParameter<PatientRecord>(
              data, 'patientref', PatientRecord.fromSnapshot),
        },
      ),
  'Acc_Profile': ParameterData.none(),
  'Input_Patient': (data) async => ParameterData(
        allParams: {
          'dept': getParameter<String>(data, 'dept'),
        },
      ),
  'input_Medication': (data) async => ParameterData(
        allParams: {
          'patientref': await getDocumentParameter<PatientRecord>(
              data, 'patientref', PatientRecord.fromSnapshot),
        },
      ),
  'splashscreen': ParameterData.none(),
  'aboutPatient': (data) async => ParameterData(
        allParams: {
          'patient': await getDocumentParameter<PatientRecord>(
              data, 'patient', PatientRecord.fromSnapshot),
        },
      ),
  'Patients': (data) async => ParameterData(
        allParams: {
          'searchparam': getParameter<String>(data, 'searchparam'),
        },
      ),
  'input_Treatment': (data) async => ParameterData(
        allParams: {
          'patientref': getParameter<DocumentReference>(data, 'patientref'),
        },
      ),
  'input_IO': (data) async => ParameterData(
        allParams: {
          'patientref': getParameter<DocumentReference>(data, 'patientref'),
        },
      ),
  'DashboardDoctor': ParameterData.none(),
  'DashboardPatient': ParameterData.none(),
  'DashboardAdmin': ParameterData.none(),
  'Admin_Usermanagement': ParameterData.none(),
  'Admin_Lab': ParameterData.none(),
  'Acc_resetpass': ParameterData.none(),
  'verifyEmail': ParameterData.none(),
  'pass': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'input_Doctorsorder': (data) async => ParameterData(
        allParams: {
          'patientref': await getDocumentParameter<PatientRecord>(
              data, 'patientref', PatientRecord.fromSnapshot),
        },
      ),
  'ActivityLog': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
