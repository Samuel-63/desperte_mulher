import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../common/widgets/app_drawer.dart';
import '../common/widgets/app_footer.dart';
import '../common/widgets/escape_button.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const AppDrawer(),
      floatingActionButton: const EscapeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: const [
            Icon(Icons.spa, color: AppColors.accentLight, size: 20),
            SizedBox(width: 8),
            Text('Desperte Mulher',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: AppColors.accentLight),
            tooltip: 'Emergência 180',
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _HeroSection(),
            _WhySection(),
            _HowItWorksSection(),
            _RiskLevelsSection(),
            _CtaSection(),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}

// ─── Hero ────────────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryDark,
            AppColors.primary,
            Color(0xFF3D9970),
          ],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.xl, AppSpacing.xl, AppSpacing.xl, AppSpacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: AppSpacing.xs),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text('Metodologia FONAR — CNJ/CNMP',
                style: AppTypography.bodySmall.copyWith(color: Colors.white70)),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Entenda o risco.\nProteja sua vida.',
            style: AppTypography.displayLarge.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Uma avaliação gratuita, anônima e baseada em metodologia científica '
            'para ajudar você a reconhecer o perigo e acessar ajuda.',
            style: AppTypography.bodyLarge.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppSpacing.xl),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => context.go(AppRoutes.quiz),
              icon: const Icon(Icons.shield_outlined),
              label: const Text('Iniciar Análise de Risco'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                textStyle: AppTypography.labelButton,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white38),
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Saiba mais',
                  style:
                      AppTypography.labelButton.copyWith(color: Colors.white)),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: const [
              _Badge(icon: '🔒', label: '100% Anônimo'),
              _Badge(icon: '💚', label: 'Gratuito'),
              _Badge(icon: '🔬', label: 'Base científica'),
              _Badge(icon: '🕐', label: 'Suporte 24h'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String icon;
  final String label;
  const _Badge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 13)),
          const SizedBox(width: AppSpacing.xs),
          Text(label,
              style: AppTypography.bodySmall.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}

// ─── Por que ─────────────────────────────────────────────────────────────────

class _WhySection extends StatelessWidget {
  const _WhySection();

  static const _items = [
    (Icons.search, 'Identifica padrões invisíveis',
        'Muitas formas de controle passam despercebidas. A avaliação revela sinais que você pode não ter reconhecido.'),
    (Icons.shield_outlined, 'Apoia decisões seguras',
        'Com informações claras sobre o nível de perigo, você planeja seus próximos passos com clareza.'),
    (Icons.child_care, 'Protege seus filhos',
        'A avaliação considera o impacto sobre crianças, garantindo que eles estejam no plano de proteção.'),
    (Icons.timer_outlined, 'Você decide o ritmo',
        'Sem julgamentos, prazos ou obrigações. Feita no seu tempo, no seu espaço seguro.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('POR QUE É IMPORTANTE',
              style: AppTypography.bodySmall.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.sm),
          Text('A análise de risco\nsalva vidas',
              style: AppTypography.displayMedium),
          const SizedBox(height: AppSpacing.xl),
          ..._items.map((item) => _WhyCard(
                icon: item.$1,
                title: item.$2,
                description: item.$3,
              )),
        ],
      ),
    );
  }
}

class _WhyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const _WhyCard(
      {required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: AppColors.shadow, blurRadius: 12, offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.headlineMedium),
                const SizedBox(height: AppSpacing.xs),
                Text(description, style: AppTypography.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Como funciona ────────────────────────────────────────────────────────────

class _HowItWorksSection extends StatelessWidget {
  const _HowItWorksSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceVariant,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('COMO FUNCIONA',
              style: AppTypography.bodySmall.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.sm),
          Text('Simples, rápido\ne sigiloso', style: AppTypography.displayMedium),
          const SizedBox(height: AppSpacing.xl),
          _Step(
              number: '1',
              title: 'Responda as perguntas',
              description:
                  '15 perguntas de múltipla escolha baseadas no FONAR, com opções graduadas.'),
          _Step(
              number: '2',
              title: 'Calculamos seu risco',
              description:
                  'Um algoritmo científico analisa suas respostas e calcula o nível de risco.'),
          _Step(
              number: '3',
              title: 'Veja seu resultado',
              description:
                  'Você recebe o nível de risco (1 a 5) e recomendações personalizadas.'),
          _Step(
              number: '4',
              title: 'Acesse a rede de apoio',
              description:
                  'Conectamos você com os recursos e profissionais mais adequados para sua situação.',
              isLast: true),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final bool isLast;

  const _Step({
    required this.number,
    required this.title,
    required this.description,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(number,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16)),
              ),
            ),
            if (!isLast)
              Container(
                  width: 2,
                  height: 48,
                  color: AppColors.primary.withOpacity(0.3)),
          ],
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.headlineMedium),
                const SizedBox(height: AppSpacing.xs),
                Text(description, style: AppTypography.bodyMedium),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Níveis ───────────────────────────────────────────────────────────────────

class _RiskLevelsSection extends StatelessWidget {
  const _RiskLevelsSection();

  static const _levels = [
    (AppColors.riskVeryLow, 'Muito Baixo', '0–20%'),
    (AppColors.riskLow, 'Baixo', '21–40%'),
    (AppColors.riskModerate, 'Moderado', '41–60%'),
    (AppColors.riskHigh, 'Alto', '61–80%'),
    (AppColors.riskExtreme, 'Extremo', '81–100%'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NÍVEIS DE RISCO',
              style: AppTypography.bodySmall.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.sm),
          Text('5 níveis identificados\npela metodologia FONAR',
              style: AppTypography.displayMedium),
          const SizedBox(height: AppSpacing.xl),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: _levels
                  .map((l) => Expanded(child: Container(height: 10, color: l.$1)))
                  .toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ..._levels.map((l) => Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: l.$1.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: l.$1.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                        width: 14,
                        height: 14,
                        decoration:
                            BoxDecoration(color: l.$1, shape: BoxShape.circle)),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                        child: Text(l.$2,
                            style: AppTypography.bodyLarge.copyWith(
                                color: l.$1, fontWeight: FontWeight.w700))),
                    Text(l.$3,
                        style: AppTypography.headlineMedium.copyWith(color: l.$1)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

// ─── CTA ─────────────────────────────────────────────────────────────────────

class _CtaSection extends StatelessWidget {
  const _CtaSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Text('Pronta para dar\no primeiro passo?',
              style: AppTypography.displayMedium.copyWith(color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Você não precisa ter certeza de nada para começar. '
            'Nossa avaliação foi criada para ajudar você a enxergar com mais clareza.',
            style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          ElevatedButton.icon(
            onPressed: () => context.go(AppRoutes.quiz),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Iniciar Análise de Risco'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              textStyle: AppTypography.labelButton,
            ),
          ),
        ],
      ),
    );
  }
}
