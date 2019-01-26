:- use_module('pl-man-game/main').



rmap23:- see(normal,left,'?'),doAction(move(right)).
rmap23:- see(normal,down-right,'E'),doAction(move(up)).

rmap23:- see(normal,right,'S'),doAction(move(right)).

rmap23:- see(normal,up-left,')'),doAction(move(up)).
rmap23:- see(normal,up-left,'>'),doAction(move(none)).
rmap23:- see(normal,up,'>'),doAction(move(none)).
rmap23:- see(normal,left,'>'),doAction(move(right)).

rmap23:- see(normal,down,'.'),doAction(move(down)).
rmap23:- see(normal,right,'.'),doAction(move(right)).
rmap23:- see(normal,left,'.'),doAction(move(left)).
rmap23:- see(normal,up,'.'),doAction(move(up)).


rmap23:- see(normal,right,' '),doAction(move(right)).
rmap23:- see(normal,up,' '),doAction(move(up)).
rmap23:- see(normal,down,' '),doAction(move(down)).
rmap23:- see(normal,left,' '),doAction(move(left)).
