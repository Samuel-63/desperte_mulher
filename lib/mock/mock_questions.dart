import '../domain/entities/question_entity.dart';

/// Perguntas baseadas no FONAR — versão múltipla escolha
/// Conteúdo original preservado, formato adaptado para opções graduadas.
final List<QuestionEntity> mockQuestions = [
  QuestionEntity(
    id: 'q01',
    text: 'Ele já ameaçou ou tentou te matar?',
    category: 'Violência Física',
    helpText: 'Inclui ameaças verbais, com objetos ou com armas.',
    options: const [
      QuestionOption(id: 'q01_a', text: 'Não, nunca aconteceu', weight: 0),
      QuestionOption(id: 'q01_b', text: 'Já fez ameaças verbais', weight: 2),
      QuestionOption(id: 'q01_c', text: 'Tentou com objetos ou me machucou gravemente', weight: 4),
      QuestionOption(id: 'q01_d', text: 'Tentou me matar com arma ou de forma grave', weight: 5),
    ],
  ),
  QuestionEntity(
    id: 'q02',
    text: 'Ele possui ou tem acesso a armas de fogo?',
    category: 'Acesso a Armas',
    helpText: 'Considera armas legais ou ilegais, próprias ou de terceiros.',
    options: const [
      QuestionOption(id: 'q02_a', text: 'Não que eu saiba', weight: 0),
      QuestionOption(id: 'q02_b', text: 'Tenho dúvida / não sei ao certo', weight: 2),
      QuestionOption(id: 'q02_c', text: 'Sim, tem acesso a armas', weight: 4),
      QuestionOption(id: 'q02_d', text: 'Sim e já me ameaçou com elas', weight: 5),
    ],
  ),
  QuestionEntity(
    id: 'q03',
    text: 'Ele já te estrangulou, sufocou ou tentou te afogar?',
    category: 'Violência Física',
    helpText: 'O estrangulamento é um dos indicadores mais sérios de risco de feminicídio.',
    options: const [
      QuestionOption(id: 'q03_a', text: 'Não, nunca', weight: 0),
      QuestionOption(id: 'q03_b', text: 'Uma vez, mas foi leve', weight: 2),
      QuestionOption(id: 'q03_c', text: 'Sim, mais de uma vez', weight: 4),
      QuestionOption(id: 'q03_d', text: 'Sim, de forma grave e recorrente', weight: 5),
    ],
  ),
  QuestionEntity(
    id: 'q04',
    text: 'Ele é extremamente ciumento ou possessivo?',
    category: 'Controle',
    helpText: 'Verifica mensagens, segue você, não permite sair sem explicações.',
    options: const [
      QuestionOption(id: 'q04_a', text: 'Não, é tranquilo', weight: 0),
      QuestionOption(id: 'q04_b', text: 'Às vezes demonstra ciúme excessivo', weight: 1),
      QuestionOption(id: 'q04_c', text: 'Frequentemente me controla e monitora', weight: 2),
      QuestionOption(id: 'q04_d', text: 'Controla tudo que faço o tempo todo', weight: 3),
    ],
  ),
  QuestionEntity(
    id: 'q05',
    text: 'Ele controla seu dinheiro ou te impede de trabalhar?',
    category: 'Controle Financeiro',
    helpText: 'Inclui tirar documentos, cartões ou proibir emprego e renda própria.',
    options: const [
      QuestionOption(id: 'q05_a', text: 'Não, tenho autonomia financeira', weight: 0),
      QuestionOption(id: 'q05_b', text: 'Às vezes questiona meus gastos', weight: 1),
      QuestionOption(id: 'q05_c', text: 'Controla meu dinheiro ou me impede de trabalhar', weight: 2),
      QuestionOption(id: 'q05_d', text: 'Sou totalmente dependente e ele usa isso contra mim', weight: 3),
    ],
  ),
  QuestionEntity(
    id: 'q06',
    text: 'Ele te isola de familiares e amigos?',
    category: 'Isolamento Social',
    helpText: 'Proíbe visitas, monitora ligações ou gera conflitos com sua rede de apoio.',
    options: const [
      QuestionOption(id: 'q06_a', text: 'Não, tenho contato livre com todos', weight: 0),
      QuestionOption(id: 'q06_b', text: 'Às vezes cria situações para me afastar', weight: 1),
      QuestionOption(id: 'q06_c', text: 'Proíbe contato com familiares ou amigos específicos', weight: 2),
      QuestionOption(id: 'q06_d', text: 'Estou completamente isolada de todos', weight: 3),
    ],
  ),
  QuestionEntity(
    id: 'q07',
    text: 'A violência tem piorado ou ficado mais frequente?',
    category: 'Escalada da Violência',
    helpText: 'A escalada progressiva é um sinal grave de risco elevado.',
    options: const [
      QuestionOption(id: 'q07_a', text: 'Não, permanece igual ou melhorou', weight: 0),
      QuestionOption(id: 'q07_b', text: 'Às vezes piora em momentos de estresse', weight: 2),
      QuestionOption(id: 'q07_c', text: 'Ficou mais frequente nos últimos meses', weight: 3),
      QuestionOption(id: 'q07_d', text: 'Está muito pior e cada vez mais grave', weight: 4),
    ],
  ),
  QuestionEntity(
    id: 'q08',
    text: 'Ele já ameaçou ou machucou seus filhos ou familiares?',
    category: 'Ameaça a Terceiros',
    helpText: 'Inclui ameaças a animais de estimação ou pessoas próximas.',
    options: const [
      QuestionOption(id: 'q08_a', text: 'Não, nunca envolveu outras pessoas', weight: 0),
      QuestionOption(id: 'q08_b', text: 'Já fez ameaças verbais a familiares', weight: 2),
      QuestionOption(id: 'q08_c', text: 'Já machucou ou agrediu alguém próximo', weight: 3),
      QuestionOption(id: 'q08_d', text: 'Ameaça ou machuca filhos e familiares com frequência', weight: 4),
    ],
  ),
  QuestionEntity(
    id: 'q09',
    text: 'Você acredita que ele é capaz de te matar?',
    category: 'Percepção de Risco',
    helpText: 'A percepção da vítima é um dos preditores mais confiáveis de risco real.',
    options: const [
      QuestionOption(id: 'q09_a', text: 'Não acredito que ele chegaria a isso', weight: 0),
      QuestionOption(id: 'q09_b', text: 'Tenho dúvidas / não sei ao certo', weight: 2),
      QuestionOption(id: 'q09_c', text: 'Sim, acredito que ele é capaz', weight: 4),
      QuestionOption(id: 'q09_d', text: 'Tenho certeza que ele é capaz e já sinto minha vida em risco', weight: 5),
    ],
  ),
  QuestionEntity(
    id: 'q10',
    text: 'Ele faz uso abusivo de álcool ou drogas?',
    category: 'Substâncias',
    helpText: 'O uso abusivo aumenta significativamente o risco de agressões.',
    options: const [
      QuestionOption(id: 'q10_a', text: 'Não faz uso ou usa de forma controlada', weight: 0),
      QuestionOption(id: 'q10_b', text: 'Usa ocasionalmente e fica agressivo', weight: 1),
      QuestionOption(id: 'q10_c', text: 'Usa com frequência e piora o comportamento', weight: 2),
      QuestionOption(id: 'q10_d', text: 'É dependente e o uso está diretamente ligado às agressões', weight: 3),
    ],
  ),
  QuestionEntity(
    id: 'q11',
    text: 'Ele já te forçou a ter relações sexuais contra sua vontade?',
    category: 'Violência Sexual',
    options: const [
      QuestionOption(id: 'q11_a', text: 'Não, nunca', weight: 0),
      QuestionOption(id: 'q11_b', text: 'Me pressiona mas cede quando recuso', weight: 1),
      QuestionOption(id: 'q11_c', text: 'Já me forçou algumas vezes', weight: 3),
      QuestionOption(id: 'q11_d', text: 'Me força com frequência, sem respeitar minha vontade', weight: 4),
    ],
  ),
  QuestionEntity(
    id: 'q12',
    text: 'Ele te humilha, xinga ou te diminui?',
    category: 'Violência Psicológica',
    options: const [
      QuestionOption(id: 'q12_a', text: 'Não, me trata com respeito', weight: 0),
      QuestionOption(id: 'q12_b', text: 'Às vezes, em momentos de briga', weight: 1),
      QuestionOption(id: 'q12_c', text: 'Frequentemente, inclusive na frente de outros', weight: 2),
      QuestionOption(id: 'q12_d', text: 'Constantemente, faz parte do dia a dia', weight: 3),
    ],
  ),
  QuestionEntity(
    id: 'q13',
    text: 'Ele já te ameaçou com faca, arma ou outro objeto perigoso?',
    category: 'Violência com Armas',
    options: const [
      QuestionOption(id: 'q13_a', text: 'Não, nunca', weight: 0),
      QuestionOption(id: 'q13_b', text: 'Já usou objetos para intimidar', weight: 3),
      QuestionOption(id: 'q13_c', text: 'Já me ameaçou com faca ou arma', weight: 4),
      QuestionOption(id: 'q13_d', text: 'Já me agrediu com objeto ou arma', weight: 5),
    ],
  ),
  QuestionEntity(
    id: 'q14',
    text: 'Você tem filhos menores morando com vocês?',
    category: 'Vulnerabilidade Infantil',
    helpText: 'A presença de crianças aumenta os fatores de vulnerabilidade.',
    options: const [
      QuestionOption(id: 'q14_a', text: 'Não tenho filhos ou não moram conosco', weight: 0),
      QuestionOption(id: 'q14_b', text: 'Tenho filhos mas estão protegidos', weight: 1),
      QuestionOption(id: 'q14_c', text: 'Tenho filhos e eles presenciam as agressões', weight: 2),
      QuestionOption(id: 'q14_d', text: 'Tenho filhos e ele também os ameaça ou agride', weight: 3),
    ],
  ),
  QuestionEntity(
    id: 'q15',
    text: 'Você depende financeiramente dele para sobreviver?',
    category: 'Vulnerabilidade Financeira',
    helpText: 'A dependência financeira pode dificultar a saída da situação.',
    options: const [
      QuestionOption(id: 'q15_a', text: 'Não, tenho renda própria', weight: 0),
      QuestionOption(id: 'q15_b', text: 'Parcialmente, mas consigo me sustentar', weight: 1),
      QuestionOption(id: 'q15_c', text: 'Dependo bastante dele financeiramente', weight: 2),
      QuestionOption(id: 'q15_d', text: 'Sou totalmente dependente, sem nenhuma renda', weight: 3),
    ],
  ),
];
