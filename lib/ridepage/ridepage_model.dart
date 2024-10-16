import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/filter_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'ridepage_widget.dart' show RidepageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RidepageModel extends FlutterFlowModel<RidepageWidget> {
  ///  Local state fields for this page.

  List<String> adrees = [];
  void addToAdrees(String item) => adrees.add(item);
  void removeFromAdrees(String item) => adrees.remove(item);
  void removeAtIndexFromAdrees(int index) => adrees.removeAt(index);
  void insertAtIndexInAdrees(int index, String item) =>
      adrees.insert(index, item);
  void updateAdreesAtIndex(int index, Function(String) updateFn) =>
      adrees[index] = updateFn(adrees[index]);

  List<String> placeid = [];
  void addToPlaceid(String item) => placeid.add(item);
  void removeFromPlaceid(String item) => placeid.remove(item);
  void removeAtIndexFromPlaceid(int index) => placeid.removeAt(index);
  void insertAtIndexInPlaceid(int index, String item) =>
      placeid.insert(index, item);
  void updatePlaceidAtIndex(int index, Function(String) updateFn) =>
      placeid[index] = updateFn(placeid[index]);

  LatLng? latlong;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
