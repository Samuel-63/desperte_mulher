import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';

/// Botão de escape rápido — sempre visível no canto inferior direito.
/// Ao pressionar, fecha o app ou navega para uma página neutra (ex: tempo).
class EscapeButton extends StatefulWidget {
  const EscapeButton({super.key});

  @override
  State<EscapeButton> createState() => _EscapeButtonState();
}

class _EscapeButtonState extends State<EscapeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnim = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _handleEscape(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.exit_to_app, color: AppColors.escapeButton),
            const SizedBox(width: 8),
            Text('Sair agora?',
                style: AppTypography.headlineMedium
                    .copyWith(color: AppColors.escapeButton)),
          ],
        ),
        content: Text(
          'Você será redirecionada para uma página neutra.\nSeu progresso não será salvo.',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar',
                style: AppTypography.labelButton
                    .copyWith(color: AppColors.textHint)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _navigateToSafePlace(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.escapeButton,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Sair agora'),
          ),
        ],
      ),
    );
  }

  /// Redireciona para uma página neutra (Google) para disfarçar o uso
  void _navigateToSafePlace(BuildContext context) {
    // Navega para tela de clima — página neutra e comum
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const _SafePage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnim,
      builder: (_, child) => Transform.scale(
        scale: _pulseAnim.value,
        child: child,
      ),
      child: FloatingActionButton.extended(
        onPressed: () => _handleEscape(context),
        backgroundColor: AppColors.escapeButton,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.exit_to_app, size: 20),
        label: Text(
          'Sair',
          style: AppTypography.labelButton.copyWith(color: Colors.white),
        ),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

/// Página segura para onde o app redireciona ao pressionar escape
class _SafePage extends StatelessWidget {
  const _SafePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text('Previsão do Tempo',
            style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny, size: 80, color: Colors.amber.shade400),
            const SizedBox(height: 16),
            Text(
              '28°C — Palmas, TO',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ensolarado com poucas nuvens',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 48),
            // Botão discreto para voltar
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
              },
              child: const Text(
                'Voltar',
                style: TextStyle(color: Colors.transparent, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
