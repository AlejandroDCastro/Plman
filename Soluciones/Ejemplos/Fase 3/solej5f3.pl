:- use_module('pl-man-game/main').
:- dynamic estoy/1.

s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).
g(D):- doAction(get(D)).
u(D):- doAction(use(D)).


estoy(inicio).

r(inicio):- s(left,'l'),g(left).
r(inicio):- s(



















/*estoy(inicio).

r(derecha):- s(right,'.'),m(right),

			retract(estoy(_)),
			assert(estoy(inicio)).

r(inicio):- s(left,'l'),g(left).
r(inicio):- u(right),

			retract(estoy(inicio)),
			assert(estoy(derecha)).

r:- estoy(D),r(D).*/
