import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/entities/answer_entity.dart';
import '../../mock/mock_questions.dart';

class QuizState {
  final List<QuestionEntity> questions;
  final Map<String, AnswerEntity> answers; // questionId -> resposta escolhida
  final int currentIndex;
  final bool isFinished;

  const QuizState({
    this.questions = const [],
    this.answers = const {},
    this.currentIndex = 0,
    this.isFinished = false,
  });

  QuizState copyWith({
    List<QuestionEntity>? questions,
    Map<String, AnswerEntity>? answers,
    int? currentIndex,
    bool? isFinished,
  }) =>
      QuizState(
        questions: questions ?? this.questions,
        answers: answers ?? this.answers,
        currentIndex: currentIndex ?? this.currentIndex,
        isFinished: isFinished ?? this.isFinished,
      );

  QuestionEntity? get currentQuestion =>
      currentIndex < questions.length ? questions[currentIndex] : null;

  double get progress =>
      questions.isEmpty ? 0 : currentIndex / questions.length;

  // Peso acumulado das respostas
  int get totalScore =>
      answers.values.fold(0, (sum, a) => sum + a.weight);

  // Peso máximo possível (soma dos maxWeight de cada pergunta)
  int get maxScore =>
      questions.fold(0, (sum, q) => sum + q.maxWeight);

  int get percentScore =>
      maxScore > 0 ? ((totalScore / maxScore) * 100).round() : 0;

  // Verifica se a pergunta atual já tem resposta selecionada
  AnswerEntity? selectedAnswerFor(String questionId) => answers[questionId];
}

class QuizController extends Notifier<QuizState> {
  @override
  QuizState build() {
    Future.microtask(_loadQuestions);
    return const QuizState();
  }

  void _loadQuestions() {
    state = state.copyWith(questions: mockQuestions);
  }

  /// Seleciona uma opção (mas não avança ainda — usuário confirma)
  void selectOption(String questionId, QuestionOption option) {
    final newAnswers = Map<String, AnswerEntity>.from(state.answers);
    newAnswers[questionId] = AnswerEntity(
      questionId: questionId,
      optionId: option.id,
      weight: option.weight,
    );
    state = state.copyWith(answers: newAnswers);
  }

  /// Avança para a próxima pergunta após confirmar a resposta
  void confirmAndNext() {
    final nextIndex = state.currentIndex + 1;
    final finished = nextIndex >= state.questions.length;
    state = state.copyWith(
      currentIndex: nextIndex,
      isFinished: finished,
    );
  }

  /// Volta para a pergunta anterior
  void goBack() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  void restart() {
    state = QuizState(questions: state.questions);
  }
}

final quizControllerProvider =
    NotifierProvider<QuizController, QuizState>(QuizController.new);
