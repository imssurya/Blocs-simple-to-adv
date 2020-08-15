import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
  @override
  List<Object> get probs => [];
}

class TimerStarted extends TimerEvent {
  final int duration;
  const TimerStarted({@required this.duration});

  @override
  String toString() => "TimerStarted{duration:$duration}";

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class TimerPaused extends TimerEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class TimerResumed extends TimerEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class TimerReset extends TimerEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class TimerTicked extends TimerEvent {
  final int duration;
  const TimerTicked({@required this.duration});
  @override
  List<Object> get props => [duration];
  @override
  String toString() => "TimerTicked{duration:$duration}";
}
