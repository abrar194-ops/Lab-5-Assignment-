female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).


parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).
parent(jackie, patty).
parent(jackie, selma).
parent(jackie, marge).
parent(clancy, marge).
parent(clancy, selma).
parent(clancy, patty).
parent(marge, lisa).
parent(marge, maggie).
parent(marge, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(homer, bart).
parent(selma, ling).



father(X,Y) :- male(X), parent(X,Y).

mother(X,Y) :- female(X), parent(X,Y).

son(X,Y) :- male(X),  parent(Y,X).

daughter(X,Y) :- female(X),  parent(Y,X).

sister(X,Y) :- female(X), parent(P,X), parent(P,Y), X \= Y.

brother(X,Y) :- male(X), parent(P,X), parent(P,Y), X \= Y.

grandfather(X,Y)  :- male(X) ,  parent(X,C), parent(C,Y).

grandmother(X,Y)  :- female(X) ,  parent(X,C), parent(C,Y).


aunt(X,Y) :- sister(X,C) ,parent(C,Y) .

uncle(X,Y) :- brother(X,C) ,parent(C,Y) .
%I needed sibling to do the cousin rule
sibling(X,Y) :- brother(X,Y).
sibling(X,Y) :- sister(X,Y).

cousin(X,Y) :- parent(P1,X), parent(P2,Y), sibling(P1,P2), X \= Y.
ancestor(X,Y):- parent(X,Y).

ancestor(X,Y):-parent(X,D),ancestor(D,Y).

