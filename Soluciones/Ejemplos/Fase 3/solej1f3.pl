:- use_module('pl-man-game/main').
:- dynamic estoy/1.


s(D,O):- see(normal,D,O).
m(D)  :- doAction(move(D)).
g(D)  :- doAction(get(D)).
u(D)  :- doAction(use(D)).
d(D)  :- doAction(drop(D)).

estoy(abajo).

r(termina):- s(right,'.'), m(right).
r(termina):- s(up,'.'), m(up).
r(termina):- s(left,'.'), m(left).
r(termina):- s(down,'.'), m(down).
r(termina):- s(up,'-'), u(up).
r(termina):- s(down,' '), m(down).
r(termina):- s(left,' '), m(left).


r(arriba):- s(right,' '), m(right).
r(arriba):- s(right,'a'), g(right).
r(arriba):- m(down),

            retract(estoy(arriba)),
            assert(estoy(termina)).

r(abajo):- s(left,' '), m(left).
r(abajo):- s(up,' '),m(up).
r(abajo):- m(right),

            retract(estoy(abajo)),
            assert(estoy(arriba)).

r:- estoy(D),r(D).



