# 🌿 Desperte Mulher — V2

> **Plataforma de Análise de Risco com múltipla escolha e botão de escape**

![Flutter](https://img.shields.io/badge/Flutter-3.44.4-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.12.2-blue?logo=dart)
![Version](https://img.shields.io/badge/Versão-2.0.0-green)
![Platform](https://img.shields.io/badge/Plataforma-Android%20%7C%20Web-green)

---

## 🆕 Novidades da V2

| Feature | V1 | V2 |
|---|---|---|
| Esquema de cores | Roxo/Rosa | Verde segurança + Bege |
| Tipografia | Playfair + Inter | Merriweather + Lato |
| Formato das perguntas | Sim / Não | Múltipla escolha (A/B/C/D) |
| Botão de escape | ❌ | ✅ Canto inferior direito |
| Página segura de saída | ❌ | ✅ Tela de clima neutra |
| Voltar pergunta | ❌ | ✅ Botão de voltar no quiz |
| Confirmar resposta | ❌ | ✅ Botão "Próxima pergunta" |

---

## 🔴 Botão de Escape

O botão vermelho **"Sair"** fica fixo no canto inferior direito de **todas as telas**.

Ao pressionar:
1. Exibe uma confirmação discreta
2. Fecha o app e redireciona para uma **tela de previsão do tempo** — página neutra para não chamar atenção

---

## 📋 Múltipla Escolha

Cada pergunta tem **4 opções graduadas** (A, B, C, D), do menos para o mais grave:

```
A → Sem risco / situação normal      (peso 0)
B → Risco leve / situação pontual    (peso 1-2)
C → Risco moderado / frequente       (peso 3-4)
D → Risco grave / situação extrema   (peso 4-5)
```

O score final é calculado pela **soma dos pesos** dividida pelo **máximo possível**.

---

## 🎨 Novo Design System

| Token | Valor | Uso |
|---|---|---|
| `primary` | `#2E7D5E` | Verde segurança |
| `accent` | `#E8A838` | Âmbar/dourado |
| `background` | `#F5F3EE` | Bege quente |
| `escapeButton` | `#B71C1C` | Botão de fuga |

---

## 🚀 Como Rodar

```bash
# Clone e instale
git clone https://github.com/antoniojuniorq/desperte_mulher_v2.git
cd desperte_mulher_v2
flutter pub get

# Android
flutter run

# Web
flutter create --platforms web .
flutter run -d web-server --web-port 8080
```

---

## 🏗️ Arquitetura

Clean Architecture com Riverpod (`NotifierProvider`).

```
lib/
├── core/          # Constantes, rotas, tema, erros, rede
├── domain/        # Entities, repositories (contratos), usecases
├── data/          # Implementações, datasources, models
├── mock/          # 15 perguntas FONAR com múltipla escolha
└── presentation/  # UI: home, quiz, result, login, register, profile
```

---

## 📞 Emergência

| Número | Serviço |
|---|---|
| **180** | Central de Atendimento à Mulher |
| **190** | Polícia Militar |
| **(63) 99282-0574** | Ouvidoria da Mulher — TO |

---

**Desenvolvido por Antonio Junior — Projeto Final de Curso**
