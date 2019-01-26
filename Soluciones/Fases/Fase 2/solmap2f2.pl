:- use_module('pl-man-game/main').



%Coger/usar objetos.
rmap22:- see(normal,left,'o'),not(havingObject),doAction(get(left)).
rmap22:- see(normal,down,'0'),havingObject(appearance('o')),doAction(use(up)).
rmap22:- see(normal,down,'1'),havingObject(appearance('o')),doAction(use(up)).
rmap22:- see(normal,down,'2'),havingObject(appearance('o')),doAction(use(up)).
rmap22:- see(normal,down,'3'),havingObject(appearance('o')),doAction(use(up)).
rmap22:- see(normal,right,'l'),not(havingObject),doAction(get(right)).
rmap22:- see(normal,down,'E'),havingObject(appearance('l')),doAction(use(up)).
rmap22:- see(normal,down,'4'),havingObject(appearance('l')),doAction(drop(left)).


%Movimientos sin objetos.
rmap22:- see(normal,down-left,'E'),not(havingObject),doAction(move(left)).
rmap22:- see(normal,down,'3'),not(havingObject),doAction(move(none)).
rmap22:- see(normal,down,'2'),not(havingObject),doAction(move(left)).
rmap22:- see(normal,down,'1'),not(havingObject),doAction(move(left)).
rmap22:- see(normal,down,'0'),not(havingObject),doAction(move(left)).
rmap22:- see(normal,left,'.'),not(havingObject),doAction(move(left)).
rmap22:- see(normal,right,'.'),not(havingObject),doAction(move(right)).
rmap22:- see(normal,down,'.'),not(havingObject),doAction(move(down)).
rmap22:- see(normal,up,'#'),not(havingObject),doAction(move(right)).
rmap22:- see(normal,up,' '),not(havingObject),doAction(move(up)).
rmap22:- see(normal,left,' '),not(havingObject),doAction(move(left)).
rmap22:- see(normal,right,' '),not(havingObject),doAction(move(right)).
rmap22:- see(normal,up,'.'),not(havingObject),doAction(move(up)).

%Movimientos con 'o'.
rmap22:- see(normal,right,' '),havingObject(appearance('o')),doAction(move(right)).

%Movimientos con 'l'.
rmap22:- see(normal,left,'.'),havingObject(appearance('l')),doAction(move(left)).
rmap22:- see(normal,down,'.'),havingObject(appearance('l')),doAction(move(down)).
rmap22:- see(normal,up,'.'),havingObject(appearance('l')),doAction(move(up)).
rmap22:- see(normal,right,'.'),havingObject(appearance('l')),doAction(move(right)).
rmap22:- see(normal,down,'#'),havingObject(appearance('l')),doAction(move(left)).
rmap22:- see(normal,right,' '),havingObject(appearance('l')),doAction(move(right)).
rmap22:- see(normal,up,' '),havingObject(appearance('l')),doAction(move(up)).
rmap22:- see(normal,down,' '),havingObject(appearance('l')),doAction(move(down)).
rmap22:- see(normal,left,' '),havingObject(appearance('l')),doAction(move(left)).

























































