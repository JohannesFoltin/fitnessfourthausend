import 'package:rxdart/rxdart.dart';
import 'package:trainings_api/training_api.dart';

class TrainingRepository {
  final _trainingStreamController =
      BehaviorSubject<Training>.seeded(Training());

  Stream<Training> getTraining() =>
      _trainingStreamController.asBroadcastStream();

  void safeTraining(Training training) =>
      _trainingStreamController.add(training);

  void safeExercise(Exercise exercise){
  }
}
