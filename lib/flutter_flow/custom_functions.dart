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
import '/auth/firebase_auth/auth_util.dart';

double? stringToDouble(String? str) {
  return double.parse(str!);
}

bool? containsOnlyDigits(String? str) {
  if (str == null) {
    return false;
  }
  return RegExp(r'^[0-9]+$').hasMatch(str);
}

String? removeLastTwoZero(String? price) {
  String numberString = price!.toString();
  return numberString.substring(0, numberString.length - 2);
}

int? stringToInt(String? str) {
  return int.parse(str!);
}
