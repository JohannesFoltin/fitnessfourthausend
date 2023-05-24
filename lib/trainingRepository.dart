import 'package:rxdart/rxdart.dart';
import 'package:trainings_api/training_api.dart';

class TrainingRepository {
  final _trainingStreamController =
      BehaviorSubject<Training>.seeded(Training());

  Stream<Training> getTrainingStream() =>
      _trainingStreamController.asBroadcastStream();

  Training getLastTraining() => _trainingStreamController.value;

  void safeTraining(Training training) =>
      _trainingStreamController.add(training);

  void safeExercise(Exercise exercise) {
    final exercises = _trainingStreamController.value.exercises;
    final exerciseIndex =
        exercises.indexWhere((element) => element == exercise);

    if (exerciseIndex >= 0) {
      exercises[exerciseIndex] = exercise;
    } else {
      exercises.add(exercise);
    }
    _trainingStreamController
        .add(_trainingStreamController.value.copyWith(exercises: exercises));
  }
}
