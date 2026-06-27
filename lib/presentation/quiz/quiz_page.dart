import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';
import '../common/widgets/escape_button.dart';
import 'quiz_controller.dart';
import 'widgets/question_widget.dart';
import 'widgets/quiz_progress_bar.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);
    final controller = ref.read(quizControllerProvider.notifier);

    if (state.isFinished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(AppRoutes.result, extra: state.percentScore);
      });
    }

    final hasAnswer = state.currentQuestion != null &&
        state.selectedAnswerFor(state.currentQuestion!.id) != null;

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: const EscapeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: state.currentIndex > 0
              ? () => controller.goBack()
              : () => context.go(AppRoutes.home),
        ),
        title: Text('Análise de Risco',
            style: AppTypography.headlineMedium.copyWith(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: Center(
              child: Text(
                '${state.currentIndex + 1}/${state.questions.length}',
                style:
                    AppTypography.bodySmall.copyWith(color: Colors.white60),
              ),
            ),
          ),
        ],
      ),
      body: state.questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                QuizProgressBar(progress: state.progress),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      children: [
                        _QuizHeader(
                          current: state.currentIndex + 1,
                          total: state.questions.length,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        if (state.currentQuestion != null)
                          QuestionWidget(
                            question: state.currentQuestion!,
                            selectedOptionId: state
                                .selectedAnswerFor(state.currentQuestion!.id)
                                ?.optionId,
                            onOptionSelected: (option) =>
                                controller.selectOption(
                                    state.currentQuestion!.id, option),
                          ),
                        const SizedBox(height: AppSpacing.xl),
                        // Botão confirmar
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                hasAnswer ? controller.confirmAndNext : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              disabledBackgroundColor:
                                  AppColors.divider,
                              minimumSize:
                                  const Size(double.infinity, 52),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              textStyle: AppTypography.labelButton,
                            ),
                            child: Text(
                              state.currentIndex + 1 ==
                                      state.questions.length
                                  ? 'Ver meu resultado'
                                  : 'Próxima pergunta',
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        // Nota de confidencialidade
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.divider),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.lock_outline,
                                  color: AppColors.primary, size: 16),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(
                                  'Suas respostas são 100% confidenciais e anônimas.',
                                  style: AppTypography.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxl),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _QuizHeader extends StatelessWidget {
  final int current;
  final int total;
  const _QuizHeader({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PERGUNTA $current DE $total',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Selecione a opção que melhor descreve sua situação.',
          style: AppTypography.bodySmall,
        ),
      ],
    );
  }
}
