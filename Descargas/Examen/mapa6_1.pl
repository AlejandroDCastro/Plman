%%%%%%%%%%%%%%%%%%%%%%%%% EXAM MAP %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	2
%%% PT:	00:30	[STS: 02:00]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% Este mapa contiene varios objetos indeterministas que se
%%% detallan a continuación:
%%% 1) Pasadizo de la sala inferior a la sala central:
%%%    Se abre un hueco que da de la sala inferior a la sala
%%%    central, lugar donde se guarda la llave. Este pasadizo
%%%    se abre en la pared de forma aleatoria. Concretamente,
%%%    el pasadizo se abre en la fila 6, columnas 3-11.
%%% 2) Llave azul:
%%%    La llave azul aparece aleatoriamente en cualquier parte
%%%    del pasillo que hay entre medias de las 2 salas. Concre-
%%%    tamente, en la fila 5, columnas 1-13.
%%% 3) Puerta azul:
%%%    La puerta azul aparece en cualquier lugar aleatorio de 
%%%    la pared que da acceso a la sala superior. Concretamente,
%%%    en la fila 4, columnas 1-13.
%%%
%%% El resto de objetos en este mapa son deterministas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(basicDoorKey).
load_behaviour(automaticArcher).
load_behaviour(entitySequentialMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(15, 11).
num_dots(50).
pacman_start(13, 9).
initMap:- 
	addSolidObject('#'), 
	
	% Create PassWays
	randomBetween(3,11, X), setDCellContent( X, 6, ' '),
	randomBetween(1,13,XD), setDCellContent(XD, 4, ' '),

	% Door & Key
	createGameEntity(OID_BD, '-', object, XD, 4, inactive, norule,
			[name(puerta_azul), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave azul'), appearance(attribs(normal, black, cyan))]),
	createGameEntity(OID_BK, 'a', object, rnd(1,13), 5, inactive, norule,
			[name(llave_azul), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta azul'), appearance(attribs(bold, cyan, default))]),
	basicDoorKey(init, OID_BD, [ 'pl-man':destroyGameEntity(OID_BD) ], [ OID_BK ]),

	
	% Automatic Archers
	createGameEntity(OID_AR1, ')', object, 1, 1, active, automaticArcher,
			[name(arquero1), solid(false), static(true), use_rule(norule),
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]),
	createGameEntity(OID_AR2, '(', object, 13, 2, active, automaticArcher, 
			[name(arquero2), solid(false), static(true), use_rule(norule),
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]), 
	automaticArcher(init, OID_AR1, ['@'], right, 6, [ continuous, bullet_appearance('>', bold, red, default) ]),
	automaticArcher(init, OID_AR2, ['@'],  left, 6, [ continuous, bullet_appearance('<', bold, red, default) ]),
 
	% ENEMIES
	createGameEntity(EID_0, 'E', mortal, 7, 7, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, 7, 8, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [ l,l,l,l,l,l,d,r,r,r,r,r,r,r,r,r,r,r,r,u,l,l,l,l,l,l ], [no_repeat_moves]),
	entitySequentialMovement(init, EID_1, [ r,r,r,r,r,r,u,l,l,l,l,l,l,l,l,l,l,l,l,d,r,r,r,r,r,r ], [no_repeat_moves]).
	
norule(_).
norule(_,_,_,_,_).
