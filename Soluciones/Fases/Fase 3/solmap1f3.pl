:- use_module('pl-man-game/main').
:- dynamic estoy/1.

s(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).
g(D):- doAction(get(D)).
d(D):- doAction(drop(D)).
u(D):- doAction(use(D)).
ha(O):- havingObject(appearance(O)).
h:- havingObject.
nh:- not(havingObject).


estoy(cogerllave).

r(final):- s(right,'.'),m(right).
r(final):- s(up,'.'),m(up).
r(final):- s(down,'.'),m(down).
r(final):- s(left,'.'),m(left).
r(final):- s(down,'o'),m(none).
r(final):- s(down,'_'),m(none).
r(final):- s(down,' '),m(down).
r(final):- s(left,' '),m(left).


r(vamos):- s(down,'.'),m(down).
r(vamos):- s(down,'_'),u(down),retractall(estoy(_)),assert(estoy(final)).


r(espera):- s(down,'.'),m(none).
r(espera):- s(down,'E'),m(none),retractall(estoy(_)),assert(estoy(vamos)).



r(pokeball):- s(up,'0'),m(right).
r(pokeball):- s(right,'o'),nh,g(right).
r(pokeball):- s(left,'o'),nh,g(left).
r(pokeball):- s(down,'o'),nh,g(down).
r(pokeball):- s(down,'.'),m(down).
r(pokeball):- s(up,'.'),m(up).
r(pokeball):- s(right,'.'),m(right).
r(pokeball):- s(left,' '),m(left).
r(pokeball):- m(left),retractall(estoy(_)),assert(estoy(espera)).



r(pelotita):- s(right,'o'),nh,g(right).
r(pelotita):- s(left,'o'),nh,g(left).
r(pelotita):- s(up,'o'),nh,g(up).
r(pelotita):- s(left,'.'),m(left).
r(pelotita):- s(up,'.'),m(up).
r(pelotita):- m(right),

			retract(estoy(pelotita)),
			assert(estoy(pokeball)).


r(amigos):- s(left,'.'),m(left).
r(amigos):- s(up,' '),m(up).
r(amigos):- s(up,'#'),m(left).
r(amigos):- m(up),

			retract(estoy(amigos)),
			assert(estoy(pelotita)).


r(enemigos):- s(up-left,'E'),m(up).
r(enemigos):- s(right,'.'),m(right).
r(enemigos):- m(down),

			retract(estoy(enemigos)),
			assert(estoy(amigos)).


r(posicion):- s(left,')'),m(up).
r(posicion):- s(right,'.'),m(none).
r(posicion):- s(right,'E'),m(left).
r(posicion):- s(up,'.'),m(up).
r(posicion):- m(right),

			retract(estoy(posicion)),
			assert(estoy(enemigos)).


r(arquerosvuelta2):- s(down,'.'),m(down).
r(arquerosvuelta2):- s(left,'.'),m(left).
r(arquerosvuelta2):- s(down,'>'),m(none).
r(arquerosvuelta2):- s(down-left,'>'),m(none).
r(arquerosvuelta2):- s(down,' '),m(down).
r(arquerosvuelta2):- s(left,')'),m(up),

			retract(estoy(arquerosvuelta2)),
			assert(estoy(posicion)).


r(arquerosvuelta):- s(up-right,'>'),m(up).
r(arquerosvuelta):- s(down-right,'>'),m(down).
r(arquerosvuelta):- s(left,'.'),m(left).
r(arquerosvuelta):- s(down,'.'),m(down).
r(arquerosvuelta):- s(up,'#'),m(none).
r(arquerosvuelta):- s(left,'>'),m(up),

			retract(estoy(arquerosvuelta)),
			assert(estoy(arquerosvuelta2)).


r(arquerosida):- s(right,'.'),m(right).
r(arquerosida):- s(down,'.'),m(down).	
r(arquerosida):- s(right,'#'),m(left).
r(arquerosida):- m(left),

			retract(estoy(arquerosida)),
			assert(estoy(arquerosvuelta)).



r(baja):- s(down,'.'),m(down).
r(baja):- m(right),


			retract(estoy(baja)),
			assert(estoy(arquerosida)).


r(abrirpuerta):- s(right,'-'),h,u(right).
r(abrirpuerta):- s(down,'#'),h,m(up).
r(abrirpuerta):- s(down-right,'#'),h,m(right).
r(abrirpuerta):- s(left,'#'),h,m(up).
r(abrirpuerta):- s(right,' '),h,m(right).
r(abrirpuerta):- s(right,'.'),h,d(left).
r(abrirpuerta):- m(right),

			retract(estoy(abrirpuerta)),
			assert(estoy(baja)).			


r(llave2):- llave(Z),s(down,Z),nh,g(down).
r(llave2):- llave(Z),s(right,Z),nh,g(right).
r(llave2):- s(left,' '),nh,m(left).
r(llave2):- s(left,'#'),nh,m(down).
r(llave2):- m(up),

			retract(estoy(llave2)),
			assert(estoy(abrirpuerta)).

r(saberpuerta):- s(up-right,'#'),m(down).
r(saberpuerta):- s(right,'-'),
		 s(up-right,X),
		 s(down-right,Y),
		 Z is X-Y,
		 assert(llave(Z)),
		 write('La llave es '),
		 writeln(Z),

			retract(estoy(saberpuerta)),
			assert(estoy(llave2)).


r(inicio):- s(up,' '),m(up).
r(inicio):- s(right,' '),m(right).
r(inicio):- s(left,' '),d(left).
r(inicio):- m(down),

			retract(estoy(inicio)),
			assert(estoy(saberpuerta)).


r(cogerllave):- s(right,'c'),g(right).
r(cogerllave):- s(down,'c'),g(down).
r(cogerllave):- s(down,' '),nh,m(down).
r(cogerllave):- s(down,' '),ha('c'),m(down).
r(cogerllave):- s(down,'_'),ha('c'),u(down).
r(cogerllave):- m(up),

			retract(estoy(cogerllave)),
			assert(estoy(inicio)).



r:- estoy(D),r(D).
