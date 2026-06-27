import 'package:equatable/equatable.dart';

class AnswerEntity extends Equatable {
  final String questionId;
  final String optionId;
  final int weight;

  const AnswerEntity({
    required this.questionId,
    required this.optionId,
    required this.weight,
  });

  @override
  List<Object?> get props => [questionId, optionId, weight];
}
