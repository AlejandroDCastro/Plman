:- use_module('pl-man-game/main').
:- dynamic estoy/1.


s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).
g(D):- doAction(get(D)).
u(D):- doAction(use(D)).
h:- havingObject.
nh:- not(havingObject).


estoy(abajo).


r(fin):- s(up,'>'),m(none).
r(fin):- s(up,'<'),m(none).
r(fin):- s(right,'.'),m(right).
r(fin):- s(up-right,'>'),m(up).
r(fin):- s(up,' '),m(up).


r(yacasi):- s(up,'<'),m(none).
r(yacasi):- s(up-right,'<'),m(none).
r(yacasi):- s(left,'.'),m(left).
r(yacasi):- s(up,'.'),m(up).
r(yacasi):- m(down),retractall(estoy(_)),assert(estoy(fin)).


r(superior):- s(right,' '),m(right).
r(superior):- m(left),retractall(estoy(_)),assert(estoy(yacasi)).


r(arriba):- s(up,' '),m(up),writeln('Pasillo superior').
r(arriba):- s(up,'-'),u(up).
r(arriba):- s(left,' '),m(left).
r(arriba):- m(right),retractall(estoy(_)),assert(estoy(superior)).


r(izquierda):- s(right,'a'),nh,g(right).
r(izquierda):- s(right,' '),m(right).
r(izquierda):- m(none),retractall(estoy(_)),assert(estoy(arriba)).


r(central):- s(up,'a'),nh,g(up).
r(central):- s(left,'a'),nh,g(left).
r(central):- s(right,'a'),nh,g(right).
r(central):- s(up,' '),m(up),writeln('Pasillo central').
r(central):- s(left,' '),m(left).
r(central):- m(right),retractall(estoy(_)),assert(estoy(izquierda)).


r(avanza):- s(up,'.'),m(up).
r(avanza):- s(left,'.'),m(left).
r(avanza):- s(down,'.'),m(down).
r(avanza):- s(right,'.'),m(right).
r(avanza):- m(right),retractall(estoy(_)),assert(estoy(central)).


r(abajo):- s(up,'.'),m(none),writeln('Pasillo inferior').
r(abajo):- s(up,'E'),m(none),retractall(estoy(_)),assert(estoy(avanza)).


r:- estoy(D),r(D).
