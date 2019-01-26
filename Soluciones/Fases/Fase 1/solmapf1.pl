:- use_module('pl-man-game/main').



rmap11:- see(normal,left,'.'),doAction(move(left)).
rmap11:- see(normal,up-left,'F'),doAction(move(none)).
rmap11:- see(normal,up,'F'),doAction(move(none)).
rmap11:- see(normal,up-right,'F'),doAction(move(none)).
rmap11:- see(normal,up-right,'E'),doAction(move(none)).
rmap11:- see(normal,up,'E'),doAction(move(none)).
rmap11:- see(normal,down,'.'),doAction(move(down)).
rmap11:- see(normal,right,'.'),doAction(move(right)).
rmap11:- see(normal,up,'.'),doAction(move(up)).
rmap11:- see(normal,down,' '),doAction(move(down)).



rmap12:- see(normal,left,'.'),doAction(move(left)).
rmap12:- see(normal,left,'o'),doAction(move(left)).
rmap12:- see(normal,down,'.'),doAction(move(down)).
rmap12:- see(normal,right,'.'),doAction(move(right)).
rmap12:- see(normal,up,'.'),doAction(move(up)).
rmap12:- see(normal,left,' '),doAction(move(left)).
rmap12:- see(normal,right,'$'),doAction(get(right)).
rmap12:- see(normal,left,'"'),doAction(use(left)).
rmap12:- see(normal,right,' '),doAction(move(right)).



rmap13:- see(normal,right,'.'),doAction(move(right)).
rmap13:- see(normal,up,'.'),doAction(move(up)).
rmap13:- see(normal,down,'.'),doAction(move(down)).
rmap13:- see(normal,left,'.'),doAction(move(left)).
rmap13:- see(normal,down,' '),doAction(move(down)).
rmap13:- see(normal,right,' '),doAction(move(right)).
rmap13:- see(normal,up,' '),doAction(move(up)).




