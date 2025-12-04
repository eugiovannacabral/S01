% Fatos: Disciplinas (nome, créditos, area)
disciplina(programacao1, 6, fundamental).
disciplina(calculo1, 8, matematica).
disciplina(estrutura_dados, 6, computacao).
disciplina(algoritmos, 4, computacao).
disciplina(banco_dados, 6, aplicacoes).
disciplina(redes, 4, aplicacoes).
disciplina(inteligencia_artificial, 8, computacao).
disciplina(compiladores, 6, computacao).
disciplina(teoria_grafos, 4, matematica).
disciplina(estatistica, 6, matematica).
disciplina(sistemas_operacionais, 6, computacao).
disciplina(projeto_integrador, 10, aplicacoes).

% Fatos: Pré-Requisitos (disciplina_principal, pre_requisito)
prerequisito(estrutura_dados, programacao1).
prerequisito(algoritmos, estrutura_dados).
prerequisito(banco_dados, programacao1).
prerequisito(inteligencia_artificial, algoritmos).
prerequisito(inteligencia_artificial, calculo1).
prerequisito(compiladores, algoritmos).
prerequisito(compiladores, estrutura_dados).
prerequisito(sistemas_operacionais, estrutura_dados).
prerequisito(teoria_grafos, calculo1).
prerequisito(estatistica, calculo1).
prerequisito(projeto_integrador, banco_dados).
prerequisito(projeto_integrador, sistemas_operacionais).

% Fatos: Conhecimento de Alunos (aluno, disciplina_concluida)
% Configuração de Alunos para testes:
concluiu(maria, programacao1).
concluiu(maria, calculo1).
concluiu(joao, programacao1).
concluiu(joao, estrutura_dados).
concluiu(joao, calculo1).
concluiu(ana, programacao1).
concluiu(ana, redes).
concluiu(ana, teoria_grafos).
concluiu(pedro, calculo1).
concluiu(pedro, estatistica).
concluiu(pedro, teoria_grafos).
concluiu(lucas, estrutura_dados).
concluiu(lucas, algoritmos).
concluiu(lucas, redes). 
concluiu(lucas, banco_dados).

alto_impacto(D) :-
    disciplina(D, C, _),
    C > 5,
    prerequisito(D1, D),
    prerequisito(D2, D),
    D1 \= D2.

falta_concluir(A, D) :-
    prerequisito(_, D),
    \+ concluiu(A, D).
 
aluno_apto(A, D) :-
    disciplina(D, _, Area),
    Area \= fundamental,
    \+ (prerequisito(D, P),
        \+ concluiu(A, P)).
 
especialista_comp(A) :-
    concluiu(A, D1),
    disciplina(D1, _, computacao),
    concluiu(A, D2),
    disciplina(D2, _, computacao),
    D1 \= D2.
 
deficiencia_mat(A) :-
    \+ (concluiu(A, D),
    disciplina(D, _, matematica)).

% minhaquery: especialista_comp(A), deficiencia_mat(A).
