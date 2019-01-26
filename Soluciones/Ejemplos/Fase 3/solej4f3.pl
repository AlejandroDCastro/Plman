:- use_module('pl-man-game/main').
:- dynamic estoy/1.

s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).


estoy(inicio).

r(derecha):- s(left,'E'),m(none).
r(derecha):- s(left-down,'E'),m(none).
r(derecha):- s(left-up,'E'),m(none).
r(derecha):- s(left,'.'),m(left).
r(derecha):- s(left,' '),m(left).
r(derecha):- m(down),
			retract(estoy(_)),
			assert(estoy(izquierda)).

r(izquierda):- s(right,'E'),m(none).
r(izquierda):- s(right-down,'E'),m(none).
r(izquierda):- s(right-up,'E'),m(none).
r(izquierda):- s(right,'.'),m(right).
r(izquierda):- s(right,' '),m(right).
r(izquierda):- m(down),

			retract(estoy(izquierda)),
			assert(estoy(derecha)).

r(inicio):- s(up,'.'),m(up).
r(inicio):- s(up,' '),m(up).
r(inicio):- m(right),

			retract(estoy(inicio)),
			assert(estoy(izquierda)).


r:- estoy(D),r(D).















r:- estoy(D),r(D).
