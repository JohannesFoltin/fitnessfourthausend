import 'package:fitnessfourthausend_api/training_api.dart';

/// {@template fitnessfourthausend_repository}
/// A repository that handles Training related requests.
/// {@endtemplate}

class FitnessfourthausendRepository {
  /// {@macro fitnessfourthausend_repository}

  const FitnessfourthausendRepository({required TrainingsApi api})
   : _trainingApi = api;

  final TrainingsApi _trainingApi;

  Stream<List<Training>> getTraings() => _trainingApi.getTraings();


  Future<void> saveTraining(Training training) => _trainingApi.saveTraining(training);


  Future<void> deleteTraining(String id) => _trainingApi.deleteTraining(id);
}
