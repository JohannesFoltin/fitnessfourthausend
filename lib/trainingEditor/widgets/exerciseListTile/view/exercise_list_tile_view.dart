import 'package:fitnessfourthausend/trainingEditor/widgets/exerciseListTile/bloc/exercise_list_tile_bloc.dart';
import 'package:fitnessfourthausend/trainingRepository.dart';
import 'package:flutter/cupertino.dart';
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
                    Container(
                      height: 64,
                      child: Column(
                        children: [
                          Expanded(
                            child: CupertinoScrollbar(
                              child: ListView(
                                children: [
                                  for (final exerciseSet in state.sets)
                                    ExerciseSetView(exerciseSet: exerciseSet)
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () => context
                                      .read<ExerciseListTileBloc>()
                                      .add(DeleteExerciseSet(
                                          exerciseSet: state.sets.last)),
                                  child: Text('Remove')),
                              TextButton(
                                  onPressed: () => context
                                      .read<ExerciseListTileBloc>()
                                      .add(const AddExerciseSet(value: 100, reps: 2)),
                                  child: const Text('Add Set')),
                            ],
                          )
                        ],
                      ),
                    )
                  else
                    const SizedBox.shrink()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ExerciseSetView extends StatelessWidget {
  const ExerciseSetView({
    super.key,
    required this.exerciseSet,
  });

  final ExerciseSet exerciseSet;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(exerciseSet.reps.toString()),
        Text(exerciseSet.value.toString()),
        TextButton(
          onPressed: () => context
              .read<ExerciseListTileBloc>()
              .add(ChangeExerciseSet(exerciseSet: exerciseSet)),
          child: const Text('edit'),
        ),
      ],
    );
  }
}
