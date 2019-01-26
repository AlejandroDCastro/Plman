:- use_module('pl-man-game/main').
:- dynamic estoy/1.

s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).
u(D):- doAction(use(D)).
g(D):- doAction(get(D)).
d(D):- doAction(drop(D)).


estoy(posición).

r(izquierda):- s(right,'.'),m(right), write('Derecha').
r(izquierda):- s(right,' '),m(right).
r(izquierda):- m(down),retractall(estoy(_)), assert(estoy(derecha)).





r(derecha):- s(left,' '),m(left).
r(derecha):- s(left,'.'),m(left).
r(derecha):- m(down),

			retract(estoy(derecha)),
			assert(estoy(izquierda)).

r(posición):- s(up,' '),m(up).
r(posición):- s(up,'.'),m(up).
r(posición):- s(right,'.'),m(right).
r(posición):- s(right,' '),m(right).
r(posición):- m(left),

			retract(estoy(posición)),
			assert(estoy(derecha)).


r:- estoy(D),r(D).





