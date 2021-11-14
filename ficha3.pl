%1
%se a cabeça da lista e o elemento a verificar forem iguais, para e é true
%se o corpo 
pertence(X,[X|Y]).
pertence(X,[H|Y]):- X\=H , pertence(X,Y).

%2
% 0 se a lista for vazia, senao, enquanto nao for vazia chama a função recursivamente e adiciona 1 ao resultado
comprimento(0,[]).
comprimento(R,[H|T]) :-  comprimento(N,T), R is N+1.


%3
%versao aula
difsList(0,[H | [] ]).
difsList(Res,[H|T]):- pertence(H,T), difsList(Res,T).
difsList(Res,[H|T]):- not(pertence(H,T)),difsList(N,T), Res is N+1.

%versao minh
%difsList([],P,R):- comprimento(R,P).
%difsList([H|T],P,R):- pertence(H,P),difsList(T,P,R).
%difsList([H|T],P,R):- not(pertence(H,P)),append([P,[H]],N),difsList(T,N,R).
%4

apaga1(_,[],P,P).
apaga1(H,[H|T],P,R):- append([P,T],N),apaga1(H,[],N,R).
apaga1(X,[H|T],P,R):- append([P,[H]],N),apaga1(X,T,N,R).

%versao alternativa
%apaga1(X,[X|T],T).
%apaga1(X,[H|T],[H|R]):- X \= H, apaga1(X,T,R).  

%5
apagaT(_,[],P,P).
apagaT(H,[H|T],P,R):- apagaT(H,T,P,R).
apagaT(X,[H|T],P,R):- append([P,[H]],N),apagaT(X,T,N,R).

%6
adiciona(X,P,R):- not(pertence(X,P)),append([P,[X]],R).

%7
concatena(X,P,R):- append([X,P],R).

%versao alternativa
%esta versao percorre a lista 1, adicionando-a ao resultado, e no fim, adiciona L2 ao resultado
%concatenar([],L2,L2).
%concatenar([X1| L1],L2,[X1 | R]):- concatenar(L1,L2,R).

%8
invert([],P,P).
invert([H|T],P,R):- append([[H],P],N),invert(T,N,R).


%9
sublista(_,[]):-false.
sublista([],_):-true.
sublista([H|T],[H|X]):- sublista(T,X).
sublista([H|T],[X|Z]):- sublista([H|T],X).


%funciona para duas listas
difs(0,[],[X|Y]).
difs(R,[H|T],[X|Y]):- H\=Y , nao(pertence(H,Y)) , difs(N,T,[X|Y]), R is N+1.


nao(Q):-Q,!,Fail.
nao(Q).