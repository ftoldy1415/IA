%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica 
% Grafos (Ficha 9)

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Diferentes representacaoes de grafos
%
%lista de adjacencias: [n(b,[c,g,h]), n(c,[b,d,f,h]), n(d,[c,f]), ...]
%
%termo-grafo: grafo([b,c,d,f,g,h,k],[e(b,c),e(b,g),e(b,h), ...]) or
%            digrafo([r,s,t,u],[a(r,s),a(r,t),a(s,t), ...])
%
%clausula-aresta: aresta(a,b)


%---------------------------------

g( grafo([madrid, cordoba, braga, guimaraes, vilareal, viseu, lamego, coimbra, guarda],
  [aresta(madrid, corboda, a4, 400),
   aresta(braga, guimaraes,a11, 25),
   aresta(braga, vilareal, a11, 107),
   aresta(guimaraes, viseu, a24, 174),
   aresta(vilareal, lamego, a24, 37),
   aresta(viseu, lamego,a24, 61),
   aresta(viseu, coimbra, a25, 119),
   aresta(viseu,guarda, a25, 75)]
 )).

%--------------------------------- 
%alinea 1)
%dois vertices sao adjacentes se tiverem uma aresta em comum

%X - vertice 1
%Y - vertice 2
%K - kilometros
%E - estrada



%adjacenteAl2(X,Y, grafo(_,Es)) :- member(aresta(X,Y,_,_),Es).
%adjacenteAl2(X,Y, grafo(_,Es)) :- member(aresta(Y,X,_,_),Es).



adjacente(X,Y,E,K, grafo(_,Es)) :- member(aresta(X,Y,E,K),Es).
adjacente(X,Y,E,K, grafo(_,Es)) :- member(aresta(Y,X,E,K),Es).

%--------------------------------- 
%alinea 2)

%o programa percorre o caminho ate ao fim e constroi a lista recursivamente (exemplo,braga/lamego : ele percorre a lista ate encontrar lamego e tenta ligar recursivamente)

%invocaçao -> ?-g(G),caminho(G,braga,lamego,P). temos que instaciar sempre o grafo antes


caminho(G,A,B,P) :- caminho1(G,A,[B],P).

%condiçao de paragem
caminho1(_,A,[A|P1],[A|P1]).


caminho1(G,A,[Y|P1],P):- 
    adjacente(X,Y,_,_,G),
    nao(membro(X,[Y|P1])),
    caminho1(G,A,[X,Y|P1],P).

%adjacente unifica o X com um ponto adjacente de Y, depois disso, o nao(membro) verifica que X não é um ponto do caminho que já foi feito(evitando ciclos),
%por fim, é chamada a função caminho1 com o X adicionado ao caminho
%a verificacao de adjacencia começa em B (uma vez que a lista inicial no 3º argumento so tem B como membro) e vai fazendo de B para A encontrando as adjacencias pelo caminho)

%--------------------------------- 
% alinea 3)


ciclo(G,A,P):-
    adjacente(B,A,_,_,G), caminho(G,A,B,P1),length(P1,L),L>2,append(P1,[A],P).

%ele encontra um adjacente de A (neste caso o B) e pede um caminho de A para B (que ja sabemos que tem adjacencia com A)

%--------------------------------- 
%alinea 4)

%utilizamos uma versaodo caminho da alinea dois ma

caminhoK(G,A,B,P,K,Es):- caminho1K(G,A,[B],P,K,Es).
caminho1K(_,A,[A,P1],[A|P1],0,[]).
caminho1K(G,A,[Y|P1],P,K1,[E|Es]):-
            adjacente(X,Y,E,Ki,G),nao(membro(X,[Y|P1])),caminho1K(G,A,[X,Y|P1],P,K,Es),K1 is K+Ki.

%--------------------------------- 
%alinea 5)


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

membro(X, [X|_]).
membro(X, [_|Xs]):-
	membro(X, Xs).