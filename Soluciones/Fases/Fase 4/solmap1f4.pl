:- use_module('pl-man-game/main').
:- dynamic estoy/1.


(D,O):- see(normal,D,O).
m(D):- doAction(move(D)).
u(D):- doAction(use(D)).
d(D):- doAction(drop(D)).
g(D):- doAction(get(D)).
h:- havingObject.
nh:- not(havingObject).


estoy(escribirLoQueVeoHacia).


escribirLoQueVeoHacia(right):- see(list,right,),
			       
