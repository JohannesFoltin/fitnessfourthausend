import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnessfourthausend/trainingEditor/widgets/ticker.dart';
import 'package:fitnessfourthausend/trainingRepository.dart';

part 'clock_event.dart';
part 'clock_state.dart';

class ClockBloc extends Bloc<ClockEvent, ClockState> {
  ClockBloc(
      {required TickerUp ticker,
      required TrainingRepository trainingRepository})
      : _ticker = ticker,
        _trainingRepository = trainingRepository,
        super(const ClockInitial(_time)) {
    on<ClockStarted>(_onStarted);
    on<ClockPaused>(_onPaused);
    on<_ClockTicked>(_onTicked);
    on<ClockResumed>(_onResumed);
  }

  final TrainingRepository _trainingRepository;
  final TickerUp _ticker;
  static const int _time = 0;
  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(ClockStarted event, Emitter<ClockState> emit) {
    emit(ClockRunInProgress(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: event.duration).listen((event) {
      add(_ClockTicked(duration: event));
    });
  }

  void _onResumed(ClockResumed resume, Emitter<ClockState> emit) {
    if (state is ClockRunPause) {
      _tickerSubscription?.resume();
      emit(ClockRunInProgress(state.time));
    }
  }

  void _onPaused(ClockPaused event, Emitter<ClockState> emit) {
    if (state is ClockRunInProgress) {
      _tickerSubscription?.pause();
      emit(ClockRunPause(state.time));
    }
  }

  void _onTicked(_ClockTicked event, Emitter<ClockState> emit) {

    emit(ClockRunInProgress(event.duration));
  }
}
