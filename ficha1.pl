%exercicio1
filho(joao,jose).
filho(jose,manuel).
filho(carlos,jose).
filho(manuel,paulo).

filho(filipe,paulo).
filho(maria,paulo)
pai(paulo,filipe).
pai(paulo,maria).

avo(antonio,nadia).
avo(nuno,ana).

masculino(joao).
masculino(jose).

feminino(maria).
feminino(joana).

%xii
pai(P,F):-filho(F,P).

%xiii
avo(A,N):-filho(X,A),filho(N,X).

%xiv
neto(N,A):-avo(A,N).

%xv
descendente(X,Y):-filho(X,Y).
descendente(X,Y):-descendente(Z,Y),filho(X,Z).

%xvi
descendencia(X,Y,1):- filho(X,Y).
descendencia(X,Y,Res):-
			filho(X,Z),
			descendencia(Z,Y,N),
			Res is N+1.

%xvii
eavo(X,Y) :- descendencia(X,Y,2).


%xviii
bisavo(X,Y) :- descendencia(X,Y,3).


%xviv
triavo(X,Y) :- descendencia(X,Y,4).