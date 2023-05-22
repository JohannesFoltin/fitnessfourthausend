import 'package:fitnessfourthausend_api/training_api.dart';
import 'package:rxdart/rxdart.dart';

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
