queens(X,Y,N):-
    %queen(N,Qs),
    
    findall(Real,findnth(X,Y,N,Real),L),
    length(L,Nn),
    write("total output: "),write(Nn),nl,
    aa(X,Y,N),
    write("=========="),nl.



aa(X,Y,N):-
    findnth(X,Y,N,Real),
    findall(Real,findnth(X,Y,N,Real),L),
    length(L,Nn),
    write("=========="),nl,
    print_a(0,N,Real).

print_a(X,N,[H|T]):-
    X<N,
    %A is H,
    print(H,0,N),
    X1 is X+1,nl,
    %write("=========="),
    print_a(X1,N,T).

print_a(N,N,_).

print(X,A,N):-
    A+1=:=X,  write("Q "), 
    %A=:=N-1->  write("========"),
    A1 is A+1,
    print(X, A1,N).

print(X,A,N):-
    A<N,
    A+1=\=X,
    write("# "),
    %A=:=N-1->  write("========"),
    A1 is A+1,
    print(X, A1, N).

print(_,N,N).

queen(N, Qs) :-
	range(1, N, Ns),
	queen(Ns, [], Qs).


findnth(X,Y,N,Real):-
    queen(N,Qs),
    index(Result,Qs,X,R),
    Result=:=Y,
    Real = R.

index(H, [H|T], 1,[H|T]).
index(E, [H|T], X,[H|T1]) :- 
  X > 1, 
  Xn is X - 1, 
  index(E, T, Xn, T1).

    

queen(UnplacedQs, SafeQs, Qs) :-
	select(Q, UnplacedQs, UnplacedQs1),
	\+ attack(Q, SafeQs),
	queen(UnplacedQs1, [Q|SafeQs], Qs).
queen([], Qs, Qs).

select(X, [X|Xs], Xs).
select(X, [Y|Ys], [Y|Zs]) :- select(X, Ys, Zs).

attack(X, Xs) :-
	attack(X, 1, Xs).

attack(X, N, [Y|Ys]) :-
	X is Y + N.
attack(X, N, [Y|Ys]) :-
	X is Y - N.
attack(X, N, [Y|Ys]) :-
	N1 is N + 1,
	attack(X, N1, Ys).

range(M, N, [M|Ns]) :-
	M < N, M1 is M + 1, range(M1, N, Ns).
range(N, N, [N]).
