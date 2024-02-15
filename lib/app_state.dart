import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _currentPage = 'homeView';
  String get currentPage => _currentPage;
  set currentPage(String _value) {
    _currentPage = _value;
  }

  DocumentReference? _tranferReferent;
  DocumentReference? get tranferReferent => _tranferReferent;
  set tranferReferent(DocumentReference? _value) {
    _tranferReferent = _value;
  }

  String _creditSelected = '';
  String get creditSelected => _creditSelected;
  set creditSelected(String _value) {
    _creditSelected = _value;
  }
}
