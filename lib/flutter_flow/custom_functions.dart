import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String returnProfileGreeting(DateTime timestamp) {
  // return "morning" if it is morning, "afternoon" if afternoon and "night" if it is night
  var hour = timestamp.hour;
  if (hour >= 0 && hour < 12) {
    return "Good morning,";
  } else if (hour >= 12 && hour < 17) {
    return "Good afternoon,";
  } else {
    return "Goodnight,";
  }
}

bool? test(String? input) {
  // write a function that check if input match this H00 and  @hct.ac.ae
  if (input == null) {
    return false;
  }

  final RegExp emailPattern = RegExp(r'^H00[\w]+@hct\.ac\.ae$');

  // Check if the email matches the pattern
  return emailPattern.hasMatch(input);
}

int? totaldistanc(
  LatLng? source,
  LatLng? destination,
) {
  // write a function that calculate the total distance of source and destination
  if (source == null || destination == null) {
    return null;
  }

  // Haversine formula to calculate distance between two points on Earth
  const double radius = 6371; // Earth's radius in km
  double lat1 = source.latitude * math.pi / 180;
  double lat2 = destination.latitude * math.pi / 180;
  double lon1 = source.longitude * math.pi / 180;
  double lon2 = destination.longitude * math.pi / 180;

  double dLat = lat2 - lat1;
  double dLon = lon2 - lon1;

  double a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLon / 2), 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  // Calculate the distance
  double distance = radius * c;

  return distance.toInt();
}

double? dividetwo(
  int? totalnumber,
  int? rating,
) {
  // write a function that divde two number
  if (rating == 0) {
    return null;
  }
  return totalnumber! / rating!;
}

double? calculateAverageRating(List<double> ratings) {
  if (ratings.isEmpty) return 0.0; // Avoid division by zero

  double sum = ratings.reduce((a, b) => a + b); // Sum of all ratings
  double average = sum / ratings.length;

  // Round to the nearest 0.1 increment
  return double.parse(average.toStringAsFixed(1));
}

LatLng makelatlong(
  double lat,
  double long,
) {
  return LatLng(lat, long);
}
