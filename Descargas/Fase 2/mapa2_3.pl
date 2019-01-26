%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	2
%%% PT:	00:20 [STS: 01:00]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(basicTeletransport).
load_behaviour(entitySequentialMovement).
load_behaviour(automaticArcher).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '#', '#', '#', ' ', '¬', 'p', 'v', 'q', 'v', '¬', 'r', ' ', '#', '#', '#', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', '#', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(17, 11).
num_dots(82).
pacman_start(1, 6).
initMap:- 
	msgWindowWriteln('¿La fbf es una Forma Normal Conjuntiva: (S)i o (N)o?'),
	msgWindowWriteln('Teletransportate con la inicial correcta'),
	addSolidObject('#'), 
	createGameEntity(OID_AR1, ')', object, 1, 3, active, automaticArcher, 
			[name('Arquero 1'), solid(false), static(true), use_rule(norule),
			description('Dispara flechas automáticamente'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_TT1, 'S', object, 9, 3, active, basicTeletransport, 
			[name('Cabina de Teletransporte S1'), solid(false), static(true), use_rule(norule),
			description('Cabina que teletransporta a pacman'), appearance(attribs(bold, black, cyan))]), 
	createGameEntity(_, '?', object, 11, 3, active, norule, 
			[name('Cabina de Teletransporte S2'), solid(false), static(true), use_rule(norule),
			description('Cabina que teletransporta a pacman'), appearance(attribs(bold, black, cyan))]), 
	createGameEntity(OID_AR2, ')', object, 1, 9, active, automaticArcher, 
			[name('Arquero 2'), solid(false), static(true), use_rule(norule),
			description('Dispara flechas automáticamente'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_TT2, 'N', object, 9, 9, active, basicTeletransport, 
			[name('Cabina de Teletransporte N1'), solid(false), static(true), use_rule(norule),
			description('Cabina que teletransporta a pacman'), appearance(attribs(bold, black, cyan))]), 
	createGameEntity(_, '?', object, 11, 9, active, norule, 
			[name('Cabina de Teletransporte N2'), solid(false), static(true), use_rule(norule),
			description('Cabina que teletransporta a pacman'), appearance(attribs(bold, black, cyan))]), 
	createGameEntity(EID_0, 'E', mortal, 11, 4, active, entitySequentialMovement, [appearance(attribs(bold, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, 15, 7, active, entitySequentialMovement, [appearance(attribs(bold, red, default))]),
	basicTeletransport(init, OID_TT1, from(9, 3), to(11, 3), ['@'] ,[ viceversa ]),
	basicTeletransport(init, OID_TT2, from(9, 9), to(11, 9), ['@'] ,[ viceversa ]),
	entitySequentialMovement(init, EID_0, [ r,r,r,r,d,l,l,l,l,u ], []),
	entitySequentialMovement(init, EID_1, [ l,l,l,l,u,r,r,r,r,d ], []),
	automaticArcher(init, OID_AR1, ['@'], right, 4, [continuous, bullet_appearance('>', normal, red, default)]),
	automaticArcher(init, OID_AR2, ['@'], right, 4, [continuous, bullet_appearance('>', normal, red, default)]).

norule(_).
norule(_,_,_,_,_).
