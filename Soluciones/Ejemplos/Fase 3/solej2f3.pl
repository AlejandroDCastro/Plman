:- use_module('pl-man-game/main').
:- dynamic estoy/1.

s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).
g(D):- doAction(get(D)).
u(D):- doAction(use(D)).
d(D):- doAction(drop(D)).
ha(O):- havingObject(appearance(O)).
h:- havingObject.
nh:- not(havingObject).


estoy(izquierda).

r(derecha):- s(up,'.'),h,m(up).
r(derecha):- s(up,' '),h,m(up).
r(derecha):- s(up,'-'),h,u(up).
r(derecha):- s(left,' '),h,m(left).
r(derecha):- s(right,' '),nh,m(right).
r(derecha):- s(down,'n'),nh,g(down).


r(izquierda):- s(left,' '),nh,m(left).
r(izquierda):- s(down,'n'),nh,g(down).
r(izquierda):- s(up,'.'),h,m(up).
r(izquierda):- s(up,' '),h,m(up).
r(izquierda):- s(up,'-'),h,u(up).
r(izquierda):- s(right,' '),h,m(right).
r(izquierda):- s(right,' '),nh,m(right),

			retract(estoy(izquierda)),
			assert(estoy(derecha)).

r:- estoy(D),r(D).
