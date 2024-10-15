import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

    safeSetState(() => _loading = true);
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
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/MealPlanner_Rounded.png',
              width: 175.0,
              fit: BoxFit.cover,
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
  'Splash': ParameterData.none(),
  'SignIn': ParameterData.none(),
  'Onboarding_Slideshow': ParameterData.none(),
  'Onboarding_CreateAccount': ParameterData.none(),
  'Dashboard': ParameterData.none(),
  'MealDetails': (data) async {
    final allParams = {
      'mealRef': await getDocumentParameter<MealsRecord>(
          data, 'mealRef', MealsRecord.fromSnapshot),
    };
    return ParameterData(
      requiredParams: {
        'mealRef': serializeParam(
          allParams['mealRef'],
          ParamType.Document,
        ),
      },
      allParams: allParams,
    );
  },
  'Profile': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'AboutUs': ParameterData.none(),
  'EatingPreferences': ParameterData.none(),
  'SupportCenter': ParameterData.none(),
  'ForgotPassword': ParameterData.none(),
  'EditPreferences': (data) async => ParameterData(
        allParams: {
          'page': getParameter<int>(data, 'page'),
        },
      ),
  'Onboarding': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'OfferRidePage': ParameterData.none(),
  'RequestRidePage': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'RideDetailsPage': ParameterData.none(),
  'driver0nboarding': ParameterData.none(),
  'thankyou': ParameterData.none(),
  'Driverprofile': (data) async => ParameterData(
        allParams: {
          'driver': await getDocumentParameter<DriverRecord>(
              data, 'driver', DriverRecord.fromSnapshot),
          'admin': getParameter<bool>(data, 'admin'),
        },
      ),
  'mainpage': ParameterData.none(),
  'Ridepage': ParameterData.none(),
  'bookpage': (data) async => ParameterData(
        allParams: {
          'driver': await getDocumentParameter<DriverRecord>(
              data, 'driver', DriverRecord.fromSnapshot),
        },
      ),
  'driverdashoboard': ParameterData.none(),
  'bookedview': (data) async => ParameterData(
        allParams: {
          'docref': getParameter<DocumentReference>(data, 'docref'),
          'doc': await getDocumentParameter<BookingRecord>(
              data, 'doc', BookingRecord.fromSnapshot),
        },
      ),
  'setting': ParameterData.none(),
  'managedriver': ParameterData.none(),
  'Notification': ParameterData.none(),
  'ratingpage': (data) async => ParameterData(
        allParams: {
          'driver': getParameter<DocumentReference>(data, 'driver'),
        },
      ),
  'test': ParameterData.none(),
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
