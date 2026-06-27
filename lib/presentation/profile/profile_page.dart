import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';
import '../common/widgets/escape_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: const EscapeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go(AppRoutes.home),
        ),
        title: Text('Meu Perfil',
            style: AppTypography.headlineMedium.copyWith(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white70),
            onPressed: () => context.go(AppRoutes.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 3),
                ),
                child: const Icon(Icons.person, color: AppColors.primary, size: 48),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text('Profissional Acolhe', style: AppTypography.headlineLarge),
            Text('profissional@instituicao.gov.br', style: AppTypography.bodySmall),
            const SizedBox(height: AppSpacing.xl),
            _InfoCard(items: const [
              (Icons.business_outlined, 'Instituição', 'Casa da Mulher Brasileira'),
              (Icons.work_outline, 'Função', 'Assistente Social'),
              (Icons.location_on_outlined, 'Cidade', 'Palmas - TO'),
            ]),
            const SizedBox(height: AppSpacing.md),
            ListTile(
              tileColor: AppColors.surface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              leading: const Icon(Icons.analytics_outlined, color: AppColors.primary),
              title: Text('Nova Análise de Risco', style: AppTypography.bodyMedium),
              trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
              onTap: () => context.go(AppRoutes.quiz),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final List<(IconData, String, String)> items;
  const _InfoCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 16)],
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: Row(
            children: [
              Icon(item.$1, color: AppColors.primary, size: 20),
              const SizedBox(width: AppSpacing.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.$2, style: AppTypography.bodySmall),
                  Text(item.$3, style: AppTypography.bodyMedium
                      .copyWith(color: AppColors.textPrimary)),
                ],
              ),
            ],
          ),
        )).toList(),
      ),
    );
  }
}
