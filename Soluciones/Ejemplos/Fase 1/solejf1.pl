:- use_module('pl-man-game/main').

rej0:- see(normal,down,'.'),doAction(move(down)).
rej0:- see(normal,up,'.'),doAction(move(up)).
rej0:- see(normal,right,'.'),doAction(move(right)).
rej0:- see(normal,down,' '),doAction(move(down)).
rej0:- see(normal,right,' '),doAction(move(right)).
rej0:- see(normal,left,'.'),doAction(move(left)).


rej00:- see(normal,down,'.'),doAction(move(down)).
rej00:- see(normal,up,'.'),doAction(move(up)).
rej00:- see(normal,right,'.'),doAction(move(right)).
rej00:- see(normal,left,'#'),doAction(move(up)).
rej00:- see(normal,down-right,'#'),doAction(move(left)).
rej00:- see(normal,down,'#'),doAction(move(left)).
rej00:- see(normal,up,' '),doAction(move(up)).
rej00:- see(normal,up,'#'),doAction(move(left)).



