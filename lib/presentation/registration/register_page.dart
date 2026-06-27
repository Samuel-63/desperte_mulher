import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/routes/app_routes.dart';
import '../common/widgets/escape_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _orgController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedRole = 'Assistente Social';
  bool _isLoading = false;

  static const _roles = [
    'Assistente Social', 'Psicólogo(a)', 'Advogado(a)',
    'Delegado(a)', 'Profissional de Saúde', 'Educador(a)', 'Outros',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _orgController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Solicitação enviada! Aguarde a aprovação.'),
        backgroundColor: AppColors.riskVeryLow,
      ));
      context.go(AppRoutes.home);
    }
  }

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
        title: Text('Faça Parte da Rede',
            style: AppTypography.headlineMedium.copyWith(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cadastro de Parceiro', style: AppTypography.displayMedium),
            const SizedBox(height: AppSpacing.sm),
            Text('Profissionais e instituições que atuam no atendimento à mulher.',
                style: AppTypography.bodyMedium),
            const SizedBox(height: AppSpacing.xl),
            Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 20)],
              ),
              child: Column(
                children: [
                  _field(_nameController, 'Nome completo', Icons.person_outline),
                  const SizedBox(height: AppSpacing.md),
                  _field(_emailController, 'E-mail institucional', Icons.email_outlined,
                      type: TextInputType.emailAddress),
                  const SizedBox(height: AppSpacing.md),
                  _field(_orgController, 'Instituição / Organização', Icons.business_outlined),
                  const SizedBox(height: AppSpacing.md),
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    decoration: const InputDecoration(
                      labelText: 'Função / Cargo',
                      prefixIcon: Icon(Icons.work_outline, color: AppColors.primary),
                    ),
                    items: _roles.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
                    onChanged: (v) => setState(() => _selectedRole = v!),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _field(_passwordController, 'Senha', Icons.lock_outlined, obscure: true),
                  const SizedBox(height: AppSpacing.xl),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleRegister,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: _isLoading
                          ? const SizedBox(height: 22, width: 22,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                          : Text('Solicitar Cadastro',
                              style: AppTypography.labelButton.copyWith(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(TextEditingController c, String label, IconData icon,
      {bool obscure = false, TextInputType type = TextInputType.text}) {
    return TextField(
      controller: c,
      obscureText: obscure,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary),
      ),
    );
  }
}
