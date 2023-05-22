import 'package:fitnessfourthausend/trainingOverview//bloc/training_overview_bloc.dart';
import 'package:fitnessfourthausend_repository/trainings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingOverviewPage extends StatelessWidget {
  const TrainingOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrainingOverviewBloc(context.read<TrainingsRepository>())
            ..add(TrainingOverviewSubscriptionRequested()),
      child: const TrainingOverviewView(),
    );
  }
}

class TrainingOverviewView extends StatelessWidget {
  const TrainingOverviewView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('heollo'),
      ),
      body: BlocListener<TrainingOverviewBloc, TrainingOverviewState>(
        listenWhen: (previous, current) =>
            previous.trainingEditorStatus != current.trainingEditorStatus,
        listener: (context, state) {
          if (state.trainingEditorStatus == TrainingOverviewStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Fuck'),
                ),
              );
          }
        },
        child: Column(
          children: [
            BlocBuilder<TrainingOverviewBloc, TrainingOverviewState>(
              builder: (context, state) =>
                  Center(child: Text(state.trainings.length.toString())),
            ),
            IconButton(
              onPressed: () =>
                  context.read<TrainingOverviewBloc>().add(AddTraining()),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
