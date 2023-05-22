import 'package:fitnessfourthausend/trainingEditor/bloc/training_editor_bloc.dart';
import 'package:fitnessfourthausend_repository/fitnessfourthausend_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingEditorView extends StatelessWidget {
  const TrainingEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrainingEditorBloc(context.read<FitnessfourthausendRepository>())
            ..add(TrainingEditorSubscriptionRequested()),
      child: Scaffold(
        appBar: AppBar(title: const Text('heollo'),),
        body: BlocListener<TrainingEditorBloc, TrainingEditorState>(
          listenWhen: (previous, current) =>
              previous.trainingEditorStatus != current.trainingEditorStatus,
          listener: (context, state) {
            if (state.trainingEditorStatus == TrainingEditorStatus.failure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Fuck'),
                  ),
                );
            }
          },
          child: BlocBuilder<TrainingEditorBloc, TrainingEditorState>(
            builder: (context, state) =>
                Center(child: Text(state.trainings.length.toString())),
          ),
        ),
      ),
    );
  }
}
