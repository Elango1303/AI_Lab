DOMAINS
    INT = integer
    PL = INT*
    LPL = PL*

PREDICATES
    puzzle(PL, LPL, INT, INT, INT)
    BFS(PL, PL, LPL, LPL, INT, INT, INT)
    move(PL, PL)
    move_left(PL, PL)
    move_right(PL, PL)
    move_up(PL, PL)
    move_down(PL, PL)
    member(PL, LPL)
    writel(PL)
    out(LPL)
    invord(LPL, LPL, LPL)
    writepuz(LPL, INT)

CLAUSES
    puzzle(L1, L2, I, N, _) :-
        I < N,
        L1 = [0, 1, 2, 3, 4, 5, 6, 7, 8],
        out(L2), 
        !.
    puzzle(L1, L2, I, N, M) :-
        I < N,
        K = I + 1,
        BFS(L1, L3, L2, L4, K, J, M),
        puzzle(L3, L4, J, N, M), 
        !.
    BFS(L1, L2, L3, L4, I, J, M) :-
        move(L1, L2),
        not(member(L2, L3)),
        L4 = [L2 | L3],
        S = M * trunc(I / M),
        not(S = I),
        J = I.
    move(L1, L2) :- move_left(L1, L2).
    move(L1, L2) :- move_right(L1, L2).
    move(L1, L2) :- move_up(L1, L2).
    move(L1, L2) :- move_down(L1, L2).

    move_left([0, A, B | T], [A, 0, B | T]) :- !.
    move_left([A, 0, B | T], [A, B, 0 | T]) :- !.
    move_left([A, B, C | T], [A, B, C | T1]) :-
        move_left(T, T1), 
        !.

    move_right([A, B, 0 | T], [A, 0, B | T]) :- !.
    move_right([A, 0, B | T], [0, A, B | T]) :- !.
    move_right([A, B, C | T], [A, B, C | T1]) :-
        move_right(T, T1), 
        !.

    move_up([0, A, B, C | T], [C, A, B, 0 | T]) :- !.
    move_up([H | T], [H | T1]) :-
        move_up(T, T1), 
        !.

    move_down([A, B, C, 0 | T], [0, B, C, A | T]) :- !.
    move_down([H | T], [H | T1]) :-
        move_down(T, T1), 
        !.

    out(L) :-
        invord(L, [], L1),
        writepuz(L1, 0), 
        !.

    writepuz([], _) :- !.
    writepuz([H | T], N) :-
        N1 = N + 1,
        write("Step#", N1, nl),
        writel(H),
        nl,
        writepuz(T, N1), 
        !.

    writel([]) :- !.
    writel([A, B, C | T]) :-
        write(A, B, C, nl),
        writel(T), 
        !.

    member(M, [M | _]) :- !.
    member(M, [_ | T]) :-
        member(M, T), 
        !.

    invord([], L, L) :- !.
    invord([H | T], T1, L) :-
        invord(T, [H | T1], L), 
        !.
