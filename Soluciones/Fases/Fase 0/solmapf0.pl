:- use_module('pl-man-game/main').


rmap01:- doAction(move(right)).


rmap02:- doAction(move(up)).


rmap03:- doAction(get(up)).


rmap04:- doAction(drop(left)).


rmap05:- see(normal,down,'E'),doAction(use(down)).
rmap05:- see(normal,left,'#'),doAction(move(down)).
