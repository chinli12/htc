// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> checkstring(String? input) async {
  // write a function that return true if the input contains this H00@hct.ac.ae
  if (input == null) {
    return false;
  }

  final RegExp emailPattern = RegExp(r'^H00[\w]+@hct\.ac\.ae$');

  // Check if the email matches the pattern
  return emailPattern.hasMatch(input);
}
