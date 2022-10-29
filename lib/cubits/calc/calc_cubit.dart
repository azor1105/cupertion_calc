import 'package:equatable/equatable.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calc_state.dart';

class CalcCubit extends Cubit<CalcState> {
  CalcCubit() : super(const CalcState(enteredTask: "0"));

  void calculate() {
    const evaluator = ExpressionEvaluator();
    var expression = Expression.tryParse(enteredTask.replaceAll(RegExp(r'x'), '*').replaceAll(RegExp(r'÷'), "/"));
    if (expression != null) {
      num evalutedTask = evaluator.eval(
        expression,
        {},
      );
      emit(
        state.copyWith(
          enteredTask: evalutedTask.toString(),
          status: CalcStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          enteredTask: enteredTask,
          status: CalcStatus.failure,
          exception: Exception("Unsupported operation"),
        ),
      );
    }
  }

  void acClear() {
    emit(
      state.copyWith(enteredTask: "0", status: CalcStatus.initial),
    );
  }

  void removeLastCharacter() {
    var enteredTaskOnScreen = enteredTask;
    if (enteredTaskOnScreen != "0") {
      if (enteredTaskOnScreen.length == 1) {
        emit(
          state.copyWith(enteredTask: "0", status: CalcStatus.success),
        );
      } else {
        var lastDeletedTask =
            enteredTaskOnScreen.substring(0, enteredTaskOnScreen.length - 1);
        emit(
          state.copyWith(
            enteredTask: lastDeletedTask,
            status: CalcStatus.success,
          ),
        );
      }
    }
  }

  String get enteredTask => state.enteredTask;

  void addCharacter(String character) {
    String currentTask = enteredTask;
    if (currentTask == "0") {
      currentTask = "";
    }
    currentTask += character;
    emit(state.copyWith(enteredTask: currentTask, status: CalcStatus.success));
  }
}
