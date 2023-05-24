import 'package:fitnessfourthausend/trainingEditor/cubit/training_editor_cubit.dart';
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
    return BlocProvider(
      create: (_) =>
          TrainingEditorCubit(
            context.read<TrainingsRepository>(),
            context.read<TrainingRepository>(),
          ),
      child: const TrainingEditorView(),
    );
  }
}

class TrainingEditorView extends StatelessWidget {
  const TrainingEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainigs Editor'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<TrainingEditorCubit, TrainingEditorState>(
            builder: (context, state) {
              return Expanded(
                child: CupertinoScrollbar(
                  child: ListView(
                    children: [
                      for (final exercise in state.training.exercises)
                        Text(exercise.exerciseData.name)
                    ],
                  ),),
              );
            },
          )
        ],),
    );
  }
}
