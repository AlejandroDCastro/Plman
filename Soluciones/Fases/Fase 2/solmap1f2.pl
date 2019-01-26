:- use_module('pl-man-game/main').



%Coger/usar objetos.
rmap21:- see(normal,left,'O'),doAction(get(left)).
rmap21:- see(normal,right,'o'),doAction(get(right)).
rmap21:- see(normal,down,'|'),havingObject(appearance('o')),doAction(use(left)).
rmap21:- see(normal,up,'-'),havingObject(appearance('O')),doAction(use(right)).
rmap21:- see(normal,left,'*'),not(havingObject),doAction(get(right)).


%Movimientos normales sin objeto.
rmap21:- see(normal,up-left,'E'),not(havingObject),doAction(move(none)).
rmap21:- see(normal,up,'E'),not(havingObject),doAction(move(none)).
rmap21:- see(normal,down,'E'),not(havingObject),doAction(move(right)).
rmap21:- see(normal,left,'*'),not(havingObject),doAction(move(down)).
rmap21:- see(normal,up,'.'),not(havingObject),doAction(move(up)).
rmap21:- see(normal,down,'.'),not(havingObject),doAction(move(down)).
rmap21:- see(normal,left,'.'),not(havingObject),doAction(move(left)).
rmap21:- see(normal,right,'.'),not(havingObject),doAction(move(right)).
rmap21:- see(normal,down,'-'),not(havingObject),doAction(move(left)).
rmap21:- see(normal,up,'-'),not(havingObject),doAction(move(none)).
rmap21:- see(normal,up,' '),not(havingObject),doAction(move(up)).


%Movimientos con 'o'.
rmap21:- see(normal,up,'.'),havingObject(appearance('o')),doAction(move(up)).
rmap21:- see(normal,down,'.'),havingObject(appearance('o')),doAction(move(down)).
rmap21:- see(normal,left,'.'),havingObject(appearance('o')),doAction(move(left)).
rmap21:- see(normal,up,'E'),havingObject(appearance('o')),doAction(move(right)).
rmap21:- see(normal,left,'E'),havingObject(appearance('o')),doAction(move(up)).
rmap21:- see(normal,left,'|'),havingObject(appearance('o')),doAction(move(left)).
rmap21:- see(normal,down,' '),havingObject(appearance('o')),doAction(move(down)).


%Movimientos con 'O'.
rmap21:- see(normal,up-right,'E'),havingObject(appearance('O')),doAction(move(none)).
rmap21:- see(normal,right,'E'),havingObject(appearance('O')),doAction(move(none)).
rmap21:- see(normal,down,'E'),havingObject(appearance('O')),doAction(move(left)).
rmap21:- see(normal,down,'.'),havingObject(appearance('O')),doAction(move(down)).
rmap21:- see(normal,up,'.'),havingObject(appearance('O')),doAction(move(up)).
rmap21:- see(normal,left,'.'),havingObject(appearance('O')),doAction(move(left)).
rmap21:- see(normal,right,'.'),havingObject(appearance('O')),doAction(move(right)).
rmap21:- see(normal,right,'-'),havingObject(appearance('O')),doAction(move(right)).
rmap21:- see(normal,down,'-'),havingObject(appearance('O')),doAction(move(down)).
rmap21:- see(normal,down,'*'),havingObject(appearance('O')),doAction(move(right)).
rmap21:- see(normal,down-right,'*'),havingObject(appearance('O')),doAction(move(right)).
rmap21:- see(normal,right,' '),havingObject(appearance('O')),doAction(move(right)).
rmap21:- see(normal,up,' '),havingObject(appearance('O')),doAction(move(up)).
rmap21:- see(normal,left,' '),havingObject(appearance('O')),doAction(move(left)).



