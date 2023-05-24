import 'package:fitnessfourthausend/trainingEditor/bloc/training_editor_bloc.dart';
import 'package:fitnessfourthausend/trainingEditor/widgets/timer/timer_view.dart';
import 'package:fitnessfourthausend/trainingRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainings_api/training_api.dart';
import 'package:trainings_repository/trainings_repository.dart';

class TrainingEditorPage extends StatelessWidget {
  const TrainingEditorPage({super.key});

  // static Route<void> route({Training? initialTraining}) {
  //   return MaterialPageRoute(
  //     fullscreenDialog: true,
  //     builder: (context) =>
  //         RepositoryProvider(
  //           create: (context) => TrainingRepository(),
  //           child: const TrainingEditorPage(),
  //         ),
  //   );
  // }

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const TrainingEditorPage());
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TrainingRepository(),
      child: const TrainingEditorView(),
    );
  }
}

class TrainingEditorView extends StatelessWidget {
  const TrainingEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainingEditorBloc(
        context.read<TrainingsRepository>(),
        context.read<TrainingRepository>(),
      )..add(const SubscribeToStream()),
      child: const TrainingEdtiorFinalView(),
    );
  }
}

class TrainingEdtiorFinalView extends StatelessWidget {
  const TrainingEdtiorFinalView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Trainings Editor'),
      ),
      body: BlocBuilder<TrainingEditorBloc, TrainingEditorState>(
        buildWhen: (previous, current) =>
            previous.training.exercises.length !=
            current.training.exercises.length,
        builder: (context, state) {
          return Column(
            children: [
              const TimerView(),
              Expanded(
                child: CupertinoScrollbar(
                  child: ListView(
                    children: [
                      for (final exercise in state.training.exercises)
                        Text(exercise.exerciseData.name)
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () => context.read<TrainingEditorBloc>().add(
                            AddExercise(
                              exercise: Exercise(
                                exerciseData: ExerciseData(name: 'Test'),
                              ),
                            ),
                          ),
                      child: const Text('Add Exercise')),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<TrainingEditorBloc>()
                            .add(SubmitTraining());
                        Navigator.pop(context);
                      },
                      child: const Text('SubmitTraining'),)
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
