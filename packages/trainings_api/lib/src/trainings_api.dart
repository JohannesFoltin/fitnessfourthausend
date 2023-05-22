import '../training_api.dart';

/// {@template fitnessfourthausend_api}
/// The interface and models for an API providing access to todos.
/// {@endtemplate}
abstract class TrainingsApi {
  /// {@macro fitnessfourthausend_api}
  const TrainingsApi();

  Stream<List<Training>> getTraings();

  Future<void> saveTraining(Training training);

  Future<void> deleteTraining(String id);

}

class TrainingNotFoundException implements Exception {}
