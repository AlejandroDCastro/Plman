%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	2
%%% PT:	00:07	[STS: 00:21]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '#', '.', '.', '.', '.', ' ', ' ', ' ', ' ', ' ', '.', '.', '.', '.', ' ', '.', '#', '#'],
['#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#'],
['#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#'],
['#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#'],
['#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'],
['#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#'],
['#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#'],
['#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '#', 'S', 'L', 'I', 'P', '#', '#', '.', ' ', '.', '#', '#', 'C', 'A', 'R', 'L', 'e', 'S', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(20, 11).
num_dots(39).
pacman_start(1, 1).
initMap:- 
	addSolidObject('#'), 
	addSolidObject('S'), 
	addSolidObject('L'), 
	addSolidObject('I'), 
	addSolidObject('P'), 
	addSolidObject('C'), 
	addSolidObject('A'), 
	addSolidObject('R'), 
	addSolidObject('e'), 
	createGameEntity('"', object, 16, 1, inactive, norule, 
			[ name(hucha), solid(true), static(true), use_rule(norule), 
			  description('Hucha de cerdito gigante'), appearance(attribs(bold, black, green)) ]),
	createGameEntity('$', object, 9, 9, inactive, norule, 
			[ name(moneda), solid(false), static(false), use_rule(monedaUsoRule), 
			  description('Moneda de 2 dolares'), appearance(attribs(normal, white, default)) ]).
			  
monedaUsoRule(MonedaId,_, X, Y, _):-
      entityLocation(PtaEID,X,Y,'"'),
	changeEntityAppearance(PtaEID,'o',_),
	makeObjectNotSolid(PtaEID),
	changeObjectName(PtaEID,hucha_abierta,hucha),
	destroyGameEntity(MonedaId),
	msgWindowWriteln('Hucha de cerdito desbloqueada!'), !.
monedaUsoRule(_,_, _, _, _):-
	msgWindowWriteln('No puedo usar la moneda asi!'), !.

norule(_).
norule(_,_,_,_,_).
