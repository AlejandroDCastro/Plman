:- use_module('pl-man-game/main').
:- dynamic estoy/1.

s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).
g(D):- doAction(get(D)).
d(D):- doAction(drop(D)).
u(D):- doAction(use(D)).
h:- havingObject.
nh:- not(havingObject).


estoy(inicio).

r(llave1):- s(down,'#'),m(right).
r(llave1):- s(down-left,'#'),m(right).
r(llave1):- s(down,'+'),u(down).
r(llave1):- m().



r(llave):- s(left,'.'),m(left).
r(llave):- m(down),

		retact(estoy(llave)),
		assert(estoy(llave1)).



r(cogerllave):- llave(Z),s(left,Z),nh,g(left).
r(cogerllave):- llave(Z),s(right,Z),nh,g(right).
r(cogerllave):- llave(Z),s(up,Z),nh,g(up).
r(cogerllave):- llave(Z),s(down,Z),nh,g(down).
r(cogerllave):- s(right,'#'),m(down).
r(cogerllave):- s(up,'#'),m(right).
r(cogerllave):- s(left,'#'),m(up).
r(cogerllave):- s(down,'+'),m(left).
r(cogerllave):- s(down-left,'#'),m(left).
r(cogerllave):- m(up),

		retact(estoy(cogerllave)),
		assert(estoy(llave)).



r(inicio):- s(down,'+'),
	    s(down-left,X),
	    s(down-right,Y),
	    Z is X+Y,
	    assert(llave(Z)),
	    write('La llave es '),
	    writeln(Z),
 
		retract(estoy(inicio)),
		assert(estoy(cogerllave)).




r:- estoy(D),r(D).
