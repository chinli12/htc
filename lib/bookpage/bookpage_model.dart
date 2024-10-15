import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'bookpage_widget.dart' show BookpageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookpageModel extends FlutterFlowModel<BookpageWidget> {
  ///  Local state fields for this page.

  DestinationStruct? dest;
  void updateDestStruct(Function(DestinationStruct) updateFn) {
    updateFn(dest ??= DestinationStruct());
  }

  SourceStruct? source;
  void updateSourceStruct(Function(SourceStruct) updateFn) {
    updateFn(source ??= SourceStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for PlacePickersoce widget.
  FFPlace placePickersoceValue = FFPlace();
  // State field(s) for PlacePickerdest widget.
  FFPlace placePickerdestValue = FFPlace();
  DateTime? datePicked;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
