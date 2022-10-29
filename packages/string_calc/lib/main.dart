import 'package:expressions/expressions.dart';

void stringCalc(){
var expression = Expression.parse("1.2-1.0");
  final evaluator = const ExpressionEvaluator();
  Map<String, dynamic> context = {};
  int text = evaluator.eval(expression, context);
  print(text);
}
