// ignore_for_file: lines_longer_than_80_chars, public_member_api_docs

import 'dart:convert';

import 'package:fitnessfourthausend_api/fitnessfourthausend_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends FitnessfourthausendApi {

  const Test(SharedPreferences plugin) : _plugin = plugin;

  final SharedPreferences _plugin;

  String? _getValue(String key) => _plugin.getString(key);

  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);
  
  @override
  Future<void> deleteTraining(String id) {
    // TODO: implement deleteTraining
    throw UnimplementedError();
  }

  @override
  Stream<List<Training>> getTraings() {
    // TODO: implement getTraings
    throw UnimplementedError();
  }

  @override
  Future<void> saveTraining(Training training) {
    // TODO: implement saveTraining
    throw UnimplementedError();
  }

}