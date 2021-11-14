aresta(t,d,3).
aresta(d,c,3).
aresta(c,b,2).
aresta(b,a,2).
aresta(a,s,2).
aresta(s,e,2).
aresta(e,f,5).
aresta(f,g,2).
aresta(g,t,2).
	
estimativa(d,3).
estimativa(c,4).
estimativa(b,4).
estimativa(a,5).
estimativa(s,10).
estimativa(e,7).
estimativa(f,4).
estimativa(g,2).


%problema de estado unico

%Conjunto de estados : conjunto de tuplos (x,y,z) em que x é um ponto da aresta e Y outro ponto e z é o peso
%					   conjunto de tuplos (e,t,g) em que e é o ponto origem e t é o ponto final e g é a estimativa de distancia

%Estado inicial : 
%Estado final: 


connect(X,Y,P):- aresta(X,Y,P).
connect(X,Y,P):- aresta(Y,X,P).

goal(t).

%Depth First Search


resolve_dfs(Orig,Dest,Cam,Custo):- dfs2(Orig,Dest,[Orig],Cam,Custo). 

dfs2(Dest,Dest,LA,Cam,0):- reverse(LA,Cam).

%relembrar que o calculo do custo so pode ser feito no fim
dfs2(Act,Dest,LA,Cam,Custo):- connect(Act,X,Peso),\+ member(X,LA),
								dfs2(X,Dest,[X|LA],Cam,NCusto),Custo is NCusto + Peso.

%PESQUISA GREEDY


% Caminho/Custo é lista/variavel custo

resolve_gulosa(Nodo,Caminho/Custo):-
		estimativa(Nodo,Estima),
		agulosa([[Nodo]/0/Estima],InvCaminho/Custo/_),
		inverso(InvCaminho,Caminho).


%caso de paragem quando à cabeça da lista está o nodo objetivo (goal)

agulosa(Caminhos,Caminho):-
		obtem_melhor_g(Caminhos,Caminho),
		Caminho = [Nodo|_]/_/_,goal(Nodo).


agulosa(Caminhos,SolucaoCaminho):-
		obtem_melhor_g(Caminhos,MelhorCaminho),
		seleciona(MelhorCaminho,Caminhos,OutrosCaminhos),
		expande_gulosa(MelhorCaminho,ExpCaminhos),
		append(OutrosCaminhos, ExpCaminhos, NovoCaminhos),
		agulosa(NovoCaminhos,SolucaoCaminho).


obtem_melhor_g([Caminho],Caminho):- !.


obtem_melhor_g([Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos],MelhorCaminho):-
	Est1=< Est2,!,
	obtem_melhor_g([Caminho1/Custo1/Est1|Caminhos],MelhorCaminho).

obtem_melhor_g([_|Caminhos],MelhorCaminho):-
	obtem_melhor_g(Caminhos,MelhorCaminho).

expande_gulosa(Caminho,ExpCaminhos):-
	findall(NovoCaminho,adjacente2(Caminho,NovoCaminho),ExpCaminhos).

adjacente2([Nodo|Caminho]/Custo/_,[ProxNodo,Nodo|Caminho]/NovoCusto/Est):-
	aresta(Nodo,ProxNodo,PassoCusto),
	\+member(ProxNodo,Caminho),
	NovoCusto is Custo + PassoCusto,
	estimativa(ProxNodo,Est).




inverso(Xs,Ys):-inverso(Xs,[],Ys).

inverso([],Xs,Xs).
inverso([X|Xs],Ys,Zs):-
	inverso(Xs,[X|Ys],Zs).

seleciona(E,[E|Xs],Xs).
seleciona(E,[X|Xs],[X|Ys]):-seleciona(E,Xs,Ys).