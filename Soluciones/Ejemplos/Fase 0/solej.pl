:- use_module('pl-man-game/main').


rej1:- see(normal,right,'.'),doAction(move(right)).
rej1:- see(normal,down,'.'),doAction(move(down)).
rej1:- see(normal,left,'.'),doAction(move(left)).


rej2:- see(normal,up,'.'),doAction(move(up)).
rej2:- see(normal,right,'.'),doAction(move(right)).
rej2:- see(normal,down,'.'),doAction(move(down)).
rej2:- see(normal,left,'.'),doAction(move(left)).


rej3:- see(normal,left,'.'),doAction(move(left)).
rej3:- see(normal,left,'a'),doAction(get(left)).
rej3:- see(normal,down,'-'),doAction(use(down)).
rej3:- see(normal,down,'.'),doAction(move(down)).
rej3:- see(normal,right,'.'),doAction(move(right)).


rej4:- see(normal,left,'U'),doAction(get(left)).
rej4:- see(normal,left,'.'),doAction(move(left)).
rej4:- see(normal,right,' '),doAction(drop(right)).
rej4:- see(normal,left,'V'),doAction(get(left)).


rej5:- see(normal,up,'.'),doAction(move(up)).
rej5:- see(normal,right,'.'),doAction(move(right)).
rej5:- see(normal,down,'.'),doAction(move(down)).
rej5:- see(normal,left,'.'),doAction(move(left)).


rej6:- see(normal,up,'.'),doAction(move(up)).
rej6:- see(normal,right,'.'),doAction(move(right)).
rej6:- see(normal,left,' '),doAction(move(left)).
rej6:- see(normal,down,' '),doAction(move(down)).
rej6:- see(normal,down,'.'),doAction(move(down)).


rej7:- see(normal,up-right,'E'),doAction(move(none)).
rej7:- see(normal,right,'E'),doAction(move(none)).
rej7:- see(normal,up,'.'),doAction(move(up)).
rej7:- see(normal,right,'.'),doAction(move(right)).
rej7:- see(normal,down-left,'E'),doAction(move(none)).
rej7:- see(normal,left,'E'),doAction(move(none)).
rej7:- see(normal,left,' '),doAction(move(left)).
rej7:- see(normal,left,'#'),doAction(move(down)).


rej8:- see(normal,up,'.'),doAction(move(up)).
rej8:- see(normal,down,'.'),doAction(move(down)).
rej8:- see(normal,right,'.'),doAction(move(right)).
rej8:- see(normal,down,'l'),doAction(get(down)).
rej8:- see(normal,right,'E'),doAction(use(right)).
rej8:- see(normal,up,' '),doAction(move(up)).


rej9:- see(normal,right,'.'),doAction(move(right)).
rej9:- see(normal,up,'.'),doAction(move(up)).
rej9:- see(normal,left,'.'),doAction(move(left)).
rej9:- see(normal,down,'o'),doAction(get(down)).
rej9:- see(normal,down,' '),doAction(move(down)).
rej9:- see(normal,right,' '),doAction(move(right)).
rej9:- see(normal,down,'#'),doAction(use(right)).


rej10:- see(normal,up,'|'),doAction(move(right)).
rej10:- see(normal,right,'|'),doAction(move(none)).
rej10:- see(normal,down-right,'|'),doAction(move(none)).
rej10:- see(normal,up,'.'),doAction(move(up)).
rej10:- see(normal,down,'.'),doAction(move(down)).
rej10:- see(normal,right,'.'),doAction(move(right)).
rej10:- see(normal,left,' '),doAction(move(left)).
rej10:- see(normal,left,'|'),doAction(move(none)).
rej10:- see(normal,left,'.'),doAction(move(left)).


rej11:- see(normal,right,'.'),doAction(move(right)).
rej11:- see(normal,up,'.'),doAction(move(up)).
rej11:- see(normal,left,'.'),doAction(move(left)).
rej11:- see(normal,down,'.'),doAction(move(down)).
rej11:- see(normal,up,' '),doAction(move(left)).
