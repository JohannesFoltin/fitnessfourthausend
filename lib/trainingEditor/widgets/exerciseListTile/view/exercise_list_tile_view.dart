import 'package:fitnessfourthausend/trainingEditor/widgets/exerciseListTile/bloc/exercise_list_tile_bloc.dart';
import 'package:fitnessfourthausend/trainingRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainings_api/training_api.dart';

class ExerciseListTileView extends StatelessWidget {
  const ExerciseListTileView({required this.exercise, super.key});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseListTileBloc(
          trainingRepository: context.read<TrainingRepository>(),
          exercise: exercise),
      child: BlocBuilder<ExerciseListTileBloc, ExerciseListTileState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (state.isExpanded) {
                context.read<ExerciseListTileBloc>().add(const Collapse());
              } else {
                context.read<ExerciseListTileBloc>().add(const Expand());
              }
            },
            child: Card(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      exercise.exerciseData.name,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  if (state.isExpanded)
                    const Text('Hello')
                  else
                    const Text('nein')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
