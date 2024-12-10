# Program 2: Simple Program Using Variables and Operators

This program demonstrates various concepts using logic programming, including relationships, arithmetic operations, and recursive algorithms.

---

## 1. Food Relation Program
### Facts
food(burger).
food(sandwich).
food(pizza).
lunch(sandwich).
dinner(pizza).

### Rules
meal(X) :- food(X).

### Queries
?- food(pizza).
?- meal(X), lunch(X).
?- dinner(sandwich).


## 2. Student-Teacher Relation Program
### Facts
studies(charlie, csc135).
studies(olivia, csc135).
studies(jack, csc131).
studies(arthur, csc134).

teaches(kirke, csc135).
teaches(collins, csc131).
teaches(collins, csc171).
teaches(juniper, csc134).

### Rules
professor(X, Y) :-
    teaches(X, C),
    studies(Y, C).

### Queries
?- studies(charlie, What).
?- professor(kirke, Students).


## 3. Family Relationships
### Predicates
parent(a, b).
sister(a, c).
male(a).
female(b).

### Rules
child(X, Y) :- parent(Y, X).
mother(X, Y) :- female(X), parent(X, Y).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
brother(X, Y) :- male(X), parent(V, X), parent(V, Y).


## 4. Animal Characteristics
### Facts
small(rat).
small(cat).
large(lion).
color(dog, black).
color(rabbit, white).

## Rules
color(X, dark) :-
    color(X, black);
    color(X, brown).


## 5. Integer Variable Usage
### Predicate
go :-
    X = 10,
    write(X), nl,
    X = 20,
    write(X), nl.


## 6. Add Two Numbers
### Predicate
add :-
    write("Input first number: "), readint(X),
    write("Input second number: "), readint(Y),
    Z is X + Y,
    write("Output = "), write(Z), nl.

## 7. Arithmetic Operations

?- X is 3 + 2.       X = 5
?- X is 3 * 2.      X = 6
?- X is 3 mod 5.    X = 3
?- X is 5 ^ 3.      X = 125


## 8. Reading Address with Compound Variables
### Domains
person = address(name, street, city, state, zip).
name, street, city, state, zip = string.

### Predicates
readaddress(person).
go.

### Clauses
go :-
    readaddress(Address),
    nl, write(Address), nl,
    nl, write("Accept (y/n)? "), readchar(Reply),
    Reply = 'y', !.

go :-
    nl, write("Please re-enter"), nl,
    go.

readaddress(address(N, S, C, St, Z)) :-
    write("Name: "), readln(N),
    write("Street: "), readln(S),
    write("City: "), readln(C),
    write("State: "), readln(St),
    write("Zip: "), readln(Z).


## 9. Cut Operator
### Predicate
fun(Y, 1) :- Y < 3, !.
fun(Y, 2) :- Y > 3, Y =< 10, !.
fun(Y, 3) :- Y > 10, !.


## 10. Towers of Hanoi
### Rules
move(1, X, Y, _) :-
    write('Move top disk from '),
    write(X), write(' to '), write(Y), nl.

move(N, X, Y, Z) :-
    N > 1,
    M is N - 1,
    move(M, X, Z, Y),
    move(1, X, Y, _),
    move(M, Z, Y, X).
