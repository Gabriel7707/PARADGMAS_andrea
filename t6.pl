repete(0, _, []).   
repete(N, C, L) :- 
   N > 0,
   L = [C | T],
   N1 is N - 1,
   repete(N1, C, T).

zeroInit([A|_]):- 0 =:= A.              % 1

conta([],0).
conta([_|L2],T):-
    T = T2 + 1,
    conta(L2,T2).
has5(L):- conta(L,T) , T =:= 5 .         % 2
 
hasN(L,N):-length(L,T), T =:= N .       % 3

 
potNo(0,[]).                            % 4 
potNo(N,L):-
    N > 0,
    C is 2^N,
    L = [C|T],
    N1 is N - 1 ,
    potNo(N1,T).
 

zipmult([],_,[]).                       % 5
zipmult(_,[],[]).
zipmult([H1|T1],[H2|T2],L) :-
    H is H1 * H2,
    L = [H|T],
    zipmult(T1,T2,T).


potAux(A,[],A).
potAux(N,L,P):-
    C is 2^P,
    L = [C|T],
    P2 is P+1,
    potAux(N,T,P2).
 
potencias(N,L) :- N > 0 , potAux(N,L,0).  %6

positivos([],[]).                         %7
positivos([H|T],Lf):- 
    H > -1,
    Lf = [H|LfT],
    positivos(T,LfT).

positivos([H|T],Lf):- 
    H < 0 ,
    positivos(T,Lf).


mesmaPosicao(A,[L1H|_],[L2H|_]) :-       %8 
    A == L1H,
    A == L2H.
mesmaPosicao(A,[_|L1T], [_|L2T]) :- 
    mesmaPosicao(A,L1T,L2T).


%9 nao consegue 
%10  nao entendi a proposta 
% 