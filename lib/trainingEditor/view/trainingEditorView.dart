import 'package:fitnessfourthausend/trainingEditor/bloc/training_editor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TrainingEditorView extends StatelessWidget {
  const TrainingEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TrainingEditorBloc(),);
  }
}