// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:fitnessfourthausend_api/training_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template local_storage_fitnessfourthausend_api}
/// A Flutter implementation of the TrainingApi that uses local storage.
/// {@endtemplate}
///
class LocalStorageFitnessfourthausendApi extends TrainingsApi {
  /// {@macro local_storage_fitnessfourthausend_api}

  LocalStorageFitnessfourthausendApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  final _trainingsStreamController =
      BehaviorSubject<List<Training>>.seeded(const []);

  static const _kTrainingsCollectionKey = '__trainings_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);

  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final todosJson = _getValue(_kTrainingsCollectionKey);
    if (todosJson != null) {
      final todos = List<Map<dynamic, dynamic>>.from(
        json.decode(todosJson) as List,
      )
          .map((jsonMap) =>
              Training.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _trainingsStreamController.add(todos);
    } else {
      _trainingsStreamController.add(const []);
    }
  }

  @override
  Future<void> deleteTraining(String id) {
    // TODO: implement deleteTraining
    throw UnimplementedError();
  }

  @override
  Stream<List<Training>> getTraings() => _trainingsStreamController.asBroadcastStream();

  @override
  Future<void> saveTraining(Training training) {
      final trainings = [..._trainingsStreamController.value];
      final trainingIndex = trainings.indexWhere((t) => t.id == training.id);
      if (trainingIndex >= 0) {
        trainings[trainingIndex] = training;
      } else {
        trainings.add(training);
      }

      _trainingsStreamController.add(trainings);
      return _setValue(_kTrainingsCollectionKey, json.encode(trainings));

  }
}
