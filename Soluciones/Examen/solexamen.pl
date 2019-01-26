:- use_module('pl-man-game/main').
:- dynamic estoy/1.

s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).
u(D):- doAction(use(D)).
d(D):- doAction(drop(D)).
g(D):- doAction(get(D)).
h:- havingObject.
nh:- not(havingObject).


estoy(inicio).


r(encantado):- s(up,' '),m(up).
r(encantado):- s(up,'>'),m(none).
r(encantado):- s(up,')'),m(up).
r(encantado):- s(right,'.'),m(right).


r(adios):- s(up,' '),m(none).
r(adios):- s(up,'<'),m(none),

		retract(estoy(adios)),
		assert(estoy(encantado)).



r(flechas):- s(up-left,'<'),m(up).
r(flechas):- s(up-right,'('),m(none).
r(flechas):- s(left,'.'),m(left).
r(flechas):- m(down),

		retract(estoy(flechas)),
		assert(estoy(adios)).


r(piso3):- s(right,' '),m(right).
r(piso3):- m(left),

		retract(estoy(piso3)),
		assert(estoy(flechas)).


r(unomas):- s(up,'-'),u(up).
r(unomas):- s(up,' '),m(up).
r(unomas):- s(left,' '),m(left).
r(unomas):- m(right),

		retract(estoy(unomas)),
		assert(estoy(piso3)).



r(derecha):- s(right,' '),m(right).
r(derecha):- s(right,'a'),nh,g(right).
r(derecha):- s(left,'a'),nh,g(left).
r(derecha):- m(none),

		retract(estoy(derecha)),
		assert(estoy(unomas)).



r(piso1):- s(up,'a'),nh,g(up).
r(piso1):- s(right,'a'),nh,g(right).
r(piso1):- s(left,'a'),nh,g(left).
r(piso1):- s(up,' '),m(up).
r(piso1):- s(left,' '),m(left).
r(piso1):- m(right),

		retract(estoy(piso1)),
		assert(estoy(derecha)).



r(comienzo):- s(up,'.'),m(up).
r(comienzo):- s(left,'.'),m(left).
r(comienzo):- s(down,'.'),m(down).
r(comienzo):- s(right,'.'),m(right).
r(comienzo):- m(right),

		retract(estoy(comienzo)),
		assert(estoy(piso1)).


r(inicio):- s(up,'.'),m(none).
r(inicio):- s(up,'E'),m(none),

		retract(estoy(inicio)),
		assert(estoy(comienzo)).





r:- estoy(D),r(D).
