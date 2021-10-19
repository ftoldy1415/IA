%1
pertence(X,[X|Y]).
pertence(X,[H,Y]):- X\=H , pertence(X,Y).

%2
comprimento(0,[]).
comprimento(R,[H|T]) :-  comprimento(N,T), R is N+1.


%3
difsList(0,[H | [] ]).
difsList(Res,[H|T]):- pertence(H,T), difsList(Res,T).
difsList(Res,[H|T]):- not(pertence(H,T)),difsList(N,T), Res is N+1.


%4

nao(Q):-Q,!,Fail.
nao(Q).

%funciona para duas listas
difs(0,[],[X|Y]).
difs(R,[H|T],[X|Y]):- H\=Y , nao(pertence(H,Y)) , difs(N,T,[X|Y]), R is N+1.


