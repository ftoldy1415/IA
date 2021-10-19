%i
add(X,Y,Add):- Add is X+Y.

%ii
addThree(X,Y,Z,Add):- Add is X+Y+Z.

%iii
operation(X,Y,*,Res):- Res is X*Y.
operation(X,Y,+,Res):- Res is X+Y.
operation(X,Y,-,Res):- Res is X-Y.
operation(X,Y,:,Res):- Res is div(X,Y).

%iv
maximum(X,X,Max):- Max is X.
maximum(X,Y,Max):- X>Y,maximum(X,X,Max).
maximum(X,Y,Max):- X<Y,maximum(Y,Y,Max).

%v
maximumThrees(X,X,X,Max):- Max is X.
maximumThrees(X,Y,Z,Max):- X>Y,maximumThrees(X,Z,X,Max).
maximumThrees(X,Y,Z,Max):- X<Y,maximumThrees(Z,Y,Y,Max).

%vi
minimum(X,X,Min):- Min is X.
minimum(X,Y,Min):- X<Y,minimum(X,X,Min).
minimum(X,Y,Min):- X>Y,minimum(Y,Y,Min).

%vii
minimumThrees(X,X,X,Min):- Min is X.
minimumThrees(X,Y,Z,Min):- X<Y,minimumThrees(X,Z,X,Min).
minimumThrees(X,Y,Z,Min):- X>Y,minimumThrees(Z,Y,Y,Min).

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

