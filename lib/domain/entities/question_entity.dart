import 'package:equatable/equatable.dart';

/// Opção de resposta para múltipla escolha
class QuestionOption extends Equatable {
  final String id;
  final String text;
  final int weight; // peso da opção para cálculo de risco

  const QuestionOption({
    required this.id,
    required this.text,
    required this.weight,
  });

  @override
  List<Object?> get props => [id, text, weight];
}

/// Entidade de pergunta com suporte a múltipla escolha
class QuestionEntity extends Equatable {
  final String id;
  final String text;
  final String category;
  final String? helpText;
  final List<QuestionOption> options;

  const QuestionEntity({
    required this.id,
    required this.text,
    required this.category,
    required this.options,
    this.helpText,
  });

  /// Peso máximo possível da pergunta (opção mais grave)
  int get maxWeight =>
      options.isEmpty ? 0 : options.map((o) => o.weight).reduce((a, b) => a > b ? a : b);

  @override
  List<Object?> get props => [id, text, category, options, helpText];
}
