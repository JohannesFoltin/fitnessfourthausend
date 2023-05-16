import 'package:fitnessfourthausend_api/fitnessfourthausend_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template local_storage_fitnessfourthausend_api}
/// A Flutter implementation of the TrainingApi that uses local storage.
/// {@endtemplate}
/// 
class LocalStorageFitnessfourthausendApi extends FitnessfourthausendApi {
  /// {@macro local_storage_fitnessfourthausend_api}
  const LocalStorageFitnessfourthausendApi(
    {required SharedPreferences plugin,}
  ) : _plugin = plugin;
  
  final SharedPreferences _plugin;

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
