%i
add(X,Y,Add):- Add is X+Y.

%ii
addThree(X,Y,Z,Add):- Add is X+Y+Z.

%iii
operation(X,Y,*,Res):- Res is X*Y.
operation(X,Y,+,Res):- Res is X+Y.
operation(X,Y,-,Res):- Res is X-Y.
operation(X,Y,:,Res):- Res is div(X,Y).


%iii versao alternativa castiço
math(Op,X,Y,R):- Op == + , R is X + Y.
math(Op,X,Y,R):- Op == - , R is X - Y.
math(Op,X,Y,R):- Op == //, R is X // Y.
math(Op,X,Y,R):- Op == *, R is X * Y.



%iv
maximum(X,X,Max):- Max is X.
maximum(X,Y,Max):- X>Y,maximum(X,X,Max).
maximum(X,Y,Max):- X<Y,maximum(Y,Y,Max).


%iv versao alternativa castiço (mais simples)
max(X,Y,R):- X > Y, R = X.
max(X,Y,R):- R = Y.



%v
maximumThrees(X,X,X,Max):- Max is X.
maximumThrees(X,Y,Z,Max):- X>Y,maximumThrees(X,Z,X,Max).
maximumThrees(X,Y,Z,Max):- X<Y,maximumThrees(Z,Y,Y,Max).



%v versao alternativa castiço (mais simples), nao faz nenhuma chamada recursiva e 
%resolve o problema apenas numa linha para cada variavel
maxT(X,Y,Z,R):- X > Y , X > Z , R = X.
maxT(X,Y,Z,R):- Y > X , Y > Z , R = Y.
maxT(X,Y,Z,R):- R = Z.


%vi
minimum(X,X,Min):- Min is X.
minimum(X,Y,Min):- X<Y,minimum(X,X,Min).
minimum(X,Y,Min):- X>Y,minimum(Y,Y,Min).

%vi alternativa
min(X,Y,R):- X < Y , R = X.
min(X,Y,R):- R = Y.


%vii
minimumThrees(X,X,X,Min):- Min is X.
minimumThrees(X,Y,Z,Min):- X<Y,minimumThrees(X,Z,X,Min).
minimumThrees(X,Y,Z,Min):- X>Y,minimumThrees(Z,Y,Y,Min).

%vii alternativa
minT(X,Y,Z,R):- X < Y , X < Z , R = X.
minT(X,Y,Z,R):- Y < X , Y < Z , R = Y.
minT(X,Y,Z,R):- R = Z.

%viii
par(0).
par(X):- N is X-2,N>=0,par(N).


%ix
impar(1).
impar(X):- N is X-2,N>=0,impar(N).

%x
mdc(X,Y,R):- X>Y, I is X-Y, mdc(I,Y,R).
mdc(X,Y,R):- X<Y ,I is Y-X,mdc(I,X,R).
mdc(X,X,R):- R is X.


divisivel(X,Y) :- R is X/Y , Z is R*Y, Z == X.

mmc(0,_,_,R):- R is 0.
mmc(_,0,_,R):- R is 0.
mmc(X,Y,0,R):- maximum(X,Y,W), Z is W, mmc(X,Y,Z,R).
mmc(X,Y,Z,R):- min(X,Y,W), divisivel(Z,W), R is Z.
mmc(X,Y,Z,R):- maximum(X,Y,W), N is Z+W, mmc(X,Y,N,R).

