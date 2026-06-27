import 'package:flutter/material.dart';

/// Novo esquema de cores — V2
/// Tom mais sóbrio, seguro e discreto (verde escuro + bege)
/// para não chamar atenção de terceiros no celular da usuária.
class AppColors {
  AppColors._();

  // Paleta principal — Verde segurança + bege acolhedor
  static const Color primary = Color(0xFF2E7D5E);       // Verde segurança
  static const Color primaryLight = Color(0xFF4CAF85);  // Verde claro
  static const Color primaryDark = Color(0xFF1A5C42);   // Verde escuro

  static const Color accent = Color(0xFFE8A838);        // Âmbar/dourado
  static const Color accentLight = Color(0xFFF5C96A);   // Âmbar claro

  static const Color background = Color(0xFFF5F3EE);    // Bege quente
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFECEAE4); // Bege levemente escuro

  static const Color textPrimary = Color(0xFF1C2B26);   // Verde quase preto
  static const Color textSecondary = Color(0xFF4A6358);  // Verde médio
  static const Color textHint = Color(0xFF8FA89D);       // Verde cinza

  // Níveis de risco
  static const Color riskVeryLow = Color(0xFF388E3C);
  static const Color riskLow = Color(0xFF689F38);
  static const Color riskModerate = Color(0xFFF57C00);
  static const Color riskHigh = Color(0xFFE64A19);
  static const Color riskExtreme = Color(0xFFC62828);

  // Botão de escape — vermelho discreto mas acessível
  static const Color escapeButton = Color(0xFFB71C1C);
  static const Color escapeButtonHover = Color(0xFFD32F2F);

  static const Color divider = Color(0xFFD8D4CA);
  static const Color shadow = Color(0x1A2E7D5E);

  // Opções de múltipla escolha
  static const Color optionSelected = Color(0xFF2E7D5E);
  static const Color optionUnselected = Color(0xFFFFFFFF);
  static const Color optionBorder = Color(0xFFD8D4CA);
  static const Color optionSelectedBorder = Color(0xFF2E7D5E);
}
