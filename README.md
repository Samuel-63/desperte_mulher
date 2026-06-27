# Desperte Mulher

> **Plataforma de Análise de Risco para Vítimas de Violência Doméstica**

![Flutter](https://img.shields.io/badge/Flutter-3.44.4-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.12.2-blue?logo=dart)
![License](https://img.shields.io/badge/Licença-Acadêmica-green)
![Platform](https://img.shields.io/badge/Plataforma-Android%20%7C%20Web-green)

---

## Sobre o Projeto

O **Desperte Mulher** é um aplicativo mobile e web baseado na plataforma [despertemulher.org](https://despertemulher.org), desenvolvido como **Projeto Final de Curso**.

O objetivo é oferecer uma ferramenta **gratuita, anônima e baseada em metodologia científica** para que mulheres em situação de violência doméstica possam avaliar seu nível de risco e acessar orientações e redes de apoio.

> _"Reconhecer que você está em risco não é fraqueza — é o ato mais corajoso que uma mulher pode fazer por si mesma."_

---

## Funcionalidades

- **Análise de Risco** baseada no FONAR (Formulário Nacional de Avaliação de Risco — CNJ/CNMP)
- **15 perguntas** com múltipla escolha e opções graduadas de risco
- **5 níveis de risco** identificados: Muito Baixo, Baixo, Moderado, Alto e Extremo
- **Recomendações personalizadas** de acordo com o resultado
- **Botão de escape rápido** — sai do app discretamente com um toque
- **100% anônimo** — nenhum dado pessoal é exigido
- **Contatos de emergência** sempre visíveis (180, 190, Ouvidoria)
- **Login do Acolhe** — área restrita para profissionais parceiros
- **Cadastro de parceiros** da rede de atendimento

---

## 🔴 Botão de Escape

O botão **"Sair"** fica fixo no canto inferior direito de todas as telas.

Ao pressionar, o app redireciona para uma página neutra de previsão do tempo — para não chamar atenção de terceiros.

---

## Arquitetura

O projeto segue os princípios da **Clean Architecture**:

```
lib/
├── core/                    # Configurações globais
│   ├── constants/           # Cores, tipografia, espaçamento
│   ├── errors/              # Failures e exceptions
│   ├── network/             # Cliente HTTP (Dio)
│   ├── routes/              # Navegação (go_router)
│   └── theme/               # Tema do app
│
├── domain/                  # Regras de negócio
│   ├── entities/            # Modelos puros
│   ├── repositories/        # Contratos (interfaces)
│   └── usecases/            # Casos de uso
│
├── data/                    # Implementações
│   ├── datasources/         # Fontes de dados
│   ├── models/              # Modelos com serialização
│   └── repositories/        # Implementações dos contratos
│
├── mock/                    # Perguntas FONAR
│
└── presentation/            # Interface do usuário
    ├── common/widgets/      # Componentes reutilizáveis
    ├── home/                # Tela inicial
    ├── quiz/                # Análise de risco
    ├── result/              # Resultado e recomendações
    ├── login/               # Autenticação
    ├── registration/        # Cadastro de parceiros
    └── profile/             # Perfil do profissional
```

---

## Design System

| Token | Valor | Uso |
|---|---|---|
| `primary` | `#2E7D5E` | Verde segurança |
| `accent` | `#E8A838` | Âmbar/dourado |
| `background` | `#F5F3EE` | Bege quente |
| `escapeButton` | `#B71C1C` | Botão de fuga rápida |

**Tipografia:** Merriweather (títulos) + Lato (corpo)

---

## Dependências Principais

| Pacote | Finalidade |
|---|---|
| `go_router` | Navegação declarativa |
| `flutter_riverpod` | Gerenciamento de estado |
| `dio` | Requisições HTTP |
| `google_fonts` | Tipografia |
| `flutter_animate` | Animações |
| `equatable` | Comparação de objetos |
| `dartz` | Programação funcional |

---

## Como Rodar

### Pré-requisitos

- [Flutter 3.44+](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio)
- [Git](https://git-scm.com/)

### Instalação

```bash
# 1. Clone o repositório
git clone https://github.com/Samuel-63/desperte_mulher.git

# 2. Entre na pasta
cd desperte_mulher

# 3. Instale as dependências
flutter pub get

# 4. Rode no Android
flutter run

# 5. Rode no navegador
flutter create --platforms web .
flutter run -d web-server --web-port 8080
# Acesse: http://localhost:8080
```

### Gerar APK

```bash
flutter build apk --release
# APK em: build/app/outputs/flutter-apk/app-release.apk
```

---

## Metodologia — FONAR

As perguntas são baseadas no **Formulário Nacional de Avaliação de Risco (FONAR)**, estabelecido pela Resolução Conjunta n.º 5 do CNJ e CNMP, com aplicação da **Metodologia AR Pax**.

### Níveis de Risco

| Nível | Faixa | Descrição |
|---|---|---|
| 🟢 Muito Baixo | 0–20% | Poucos indicadores identificados |
| 🟡 Baixo | 21–40% | Alguns sinais de alerta |
| 🟠 Moderado | 41–60% | Padrões de controle identificados |
| 🔴 Alto | 61–80% | Múltiplos fatores de risco |
| ⛔ Extremo | 81–100% | Risco iminente — ação imediata |

---

## Parceiros e Apoios

- Ouvidoria da Mulher do Tocantins
- Casa da Mulher Brasileira — Palmas/TO
- Secretaria de Estado da Mulher — TO
- Polícia Civil do Tocantins
- Comissão de Feminicídio
- Instituto Justiça de Saia

---

## Contatos de Emergência

| Número | Serviço |
|---|---|
| **180** | Central de Atendimento à Mulher |
| **190** | Polícia Militar |
| **(63) 99282-0574** | Ouvidoria da Mulher — Tocantins |
| **(63) 3212-7496** | Casa da Mulher Brasileira — Palmas |

---

<div align="center">
  <strong>💚 Desenvolvido com propósito — porque toda mulher merece segurança</strong>
</div>
