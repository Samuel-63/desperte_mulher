import 'package:equatable/equatable.dart';

enum RiskLevel { veryLow, low, moderate, high, extreme }

extension RiskLevelExtension on RiskLevel {
  String get label => switch (this) {
        RiskLevel.veryLow => 'Muito Baixo',
        RiskLevel.low => 'Baixo',
        RiskLevel.moderate => 'Moderado',
        RiskLevel.high => 'Alto',
        RiskLevel.extreme => 'Extremo',
      };

  int get colorValue => switch (this) {
        RiskLevel.veryLow => 0xFF388E3C,
        RiskLevel.low => 0xFF689F38,
        RiskLevel.moderate => 0xFFF57C00,
        RiskLevel.high => 0xFFE64A19,
        RiskLevel.extreme => 0xFFC62828,
      };

  String get description => switch (this) {
        RiskLevel.veryLow =>
          'Poucos indicadores de risco identificados. Continue atenta aos sinais.',
        RiskLevel.low =>
          'Alguns sinais de alerta presentes. Mantenha sua rede de apoio ativa.',
        RiskLevel.moderate =>
          'Padrões de controle identificados. Documente e busque orientação.',
        RiskLevel.high =>
          'Múltiplos fatores de risco. Busque apoio especializado agora.',
        RiskLevel.extreme =>
          'Risco iminente de feminicídio. Busque segurança imediatamente. Ligue 180.',
      };
}

class QuizResultEntity extends Equatable {
  final int score;
  final RiskLevel level;
  final int answeredQuestions;
  final List<String> recommendations;
  final DateTime createdAt;

  const QuizResultEntity({
    required this.score,
    required this.level,
    required this.answeredQuestions,
    required this.recommendations,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [score, level, answeredQuestions, createdAt];
}
