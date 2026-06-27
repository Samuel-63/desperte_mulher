import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../domain/entities/question_entity.dart';

class QuestionWidget extends StatelessWidget {
  final QuestionEntity question;
  final String? selectedOptionId;
  final void Function(QuestionOption option) onOptionSelected;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.onOptionSelected,
    this.selectedOptionId,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(question.id),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow,
                blurRadius: 20,
                offset: const Offset(0, 6)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho da categoria
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.label_outline,
                      color: AppColors.primary, size: 15),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    question.category.toUpperCase(),
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texto da pergunta
                  Text(question.text, style: AppTypography.headlineLarge),

                  // Texto de ajuda
                  if (question.helpText != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVariant,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.info_outline,
                              color: AppColors.textHint, size: 15),
                          const SizedBox(width: AppSpacing.xs),
                          Expanded(
                            child: Text(question.helpText!,
                                style: AppTypography.bodySmall),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: AppSpacing.xl),

                  // Opções de múltipla escolha
                  ...question.options.asMap().entries.map(
                    (entry) {
                      final index = entry.key;
                      final option = entry.value;
                      final isSelected = selectedOptionId == option.id;

                      return _OptionCard(
                        option: option,
                        index: index,
                        isSelected: isSelected,
                        onTap: () => onOptionSelected(option),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final QuestionOption option;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptionCard({
    required this.option,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  static const _letters = ['A', 'B', 'C', 'D'];

  Color get _borderColor =>
      isSelected ? AppColors.optionSelected : AppColors.optionBorder;

  Color get _bgColor =>
      isSelected ? AppColors.optionSelected.withOpacity(0.08) : AppColors.optionUnselected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _borderColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Letra da opção
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.optionSelected : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.optionSelected : AppColors.optionBorder,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  _letters[index % _letters.length],
                  style: AppTypography.bodySmall.copyWith(
                    color: isSelected ? Colors.white : AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            // Texto da opção
            Expanded(
              child: Text(
                option.text,
                style: AppTypography.optionLabel.copyWith(
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle,
                  color: AppColors.optionSelected, size: 20),
          ],
        ),
      ),
    );
  }
}
