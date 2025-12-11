/* ----------------------------------------
   Basic Facts - Gender
---------------------------------------- */

male(john).
male(ian).
male(ivan).
male(isaac).
male(travis).

female(mary).
female(racho).
female(emily).


/* ----------------------------------------
   Parent Relationships
---------------------------------------- */

% John and Mary are parents of Ian, Ivan, and Isaac
parent(john, ian).
parent(mary, ian).

parent(john, ivan).
parent(mary, ivan).

parent(john, isaac).
parent(mary, isaac).

% Ian is the father of Travis
parent(ian, travis).

% Ivan is the parent of Emily (example cousin mapping)
parent(ivan, emily).

/* ----------------------------------------
   Derived Relationships
---------------------------------------- */

% Grandparent rule
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Sibling rule
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Cousin rule
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2).

% Recursive descendant rule
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :-
    parent(Y, Z),
    descendant(X, Z).
