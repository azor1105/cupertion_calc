part of 'calc_cubit.dart';

enum CalcStatus { initial, success, failure }

class CalcState extends Equatable {
  final CalcStatus status;
  final Exception? exception;
  final String enteredTask;

  const CalcState({
    this.status = CalcStatus.initial,
    this.exception,
    required this.enteredTask,
  });

  @override
  List<Object?> get props => [status, enteredTask, exception];

  CalcState copyWith({
    CalcStatus? status,
    Exception? exception,
    String? enteredTask,
  }) {
    return CalcState(
      enteredTask: enteredTask ?? this.enteredTask,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }
}
