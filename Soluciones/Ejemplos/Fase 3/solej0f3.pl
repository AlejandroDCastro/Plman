:- use_module('pl-man-game/main').
:- dynamic estoy/1.

s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).
g(D):- doAction(get(D)).
u(D):- doAction(use(D)).

estoy(aqui).

r(aca):- s(right,'.'),m(right).
r(aca):- s(left,'.'),m(left).
r(aca):- s(up,'.'),m(up).
r(aca):- s(right,' '),m(right).


r(aqui):- s(up,'r'),g(up).
r(aqui):- s(down,'r'),g(down).
r(aqui):- s(right,'r'),g(right).
r(aqui):- s(left,'r'),g(left).
r(aqui):- s(right,'.'),m(right).
r(aqui):- s(down,'.'),m(down).
r(aqui):- s(left,'.'),m(left).
r(aqui):- s(down,' '),m(down).
r(aqui):- s(right,' '),m(right).
r(aqui):- u(right),
			retract(estoy(aqui)),
			assert(estoy(aca)).


r:- estoy(D),r(D).
