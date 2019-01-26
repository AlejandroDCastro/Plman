:- use_module('pl-man-game/main').
:- dynamic estoy/1.


s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).


estoy(inicio).

r(inicio):- m(right).


r:- estoy(D),r(D).
