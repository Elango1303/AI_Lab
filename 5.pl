DOMAINS
    X = symbol
    Y = symbol*

PREDICATES
    child(X, X)
    childnode(X, X, Y)
    path(X, X, Y)

CLAUSES
    child(a, b).
    child(a, c).
    child(a, d).
    child(b, e).
    child(b, f).
    child(c, g).

    path(A, G, [A | Z]) :-
        childnode(A, G, Z).

    childnode(A, G, [G]) :-
        child(A, G).
    childnode(A, G, [X | L]) :-
        child(A, X),
        childnode(X, G, L).
