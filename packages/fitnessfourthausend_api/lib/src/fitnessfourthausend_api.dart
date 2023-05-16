import '../fitnessfourthausend_api.dart';

/// {@template fitnessfourthausend_api}
/// The interface and models for an API providing access to todos.
/// {@endtemplate}
abstract class FitnessfourthausendApi {
  /// {@macro fitnessfourthausend_api}
  const FitnessfourthausendApi();

  Stream<List<Training>> getTraings();

  Future<void> saveTraining(Training training);

  Future<void> deleteTraining();


}
