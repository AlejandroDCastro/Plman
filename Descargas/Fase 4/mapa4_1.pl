%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	02:30	[STS: 10:00]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% Este mapa cuenta con 4 factores indeterministas que se
%%% describen a continuación:
%%% 1) Aparicion de fantasmas en el mapa:
%%%	En este mapa pueden haber hasta 2 fantasmas simultaneos.
%%%	El mapa comenzará siempre con 0 fantasmas, y estos iran
%%%	apereciendo espaciados en el tiempo de forma aleatoria.
%%%   Los fantasmas pueden aparecer aleatoriamente en uno de
%%%   los dos puntos de renacimiento (respawn points) habilitados
%%%   para que aparezcan. Estos puntos están a la izquierda del mapa,
%%%	concretamente en las casillas (5,3) y (4,7).
%%%	En cada ciclo de ejecucion, hay un 10% de posibilidades de
%%%	que aparezca un nuevo fantasma (siempre que hayan menos de 2)
%%% 2) Comportamiento de los fantasmas:
%%%	Los fantasmas eligen una dirección aleatoria en la que
%%%	moverse y la siguen hasta llegar a una pared. Cuando
%%%	llegan a la pared, cambian aleatoriamente de dirección
%%%	y repiten. Si por el camino, yendo de pared a pared,
%%%	ven a PL-MAN en alguna dirección, cambian su dirección
%%%	de movimiento para seguir a PL-MAN con una probabilidad
%%%	del 50%. Nunca cambian de dirección más de 2 veces
%%%	entre pared y pared que tocan. Además, los porteros nunca
%%%	salen de su área (aunque pueden moverse por detrás
%%%	de la portería), y los defensas nunca entran en el área ni
%%%     cruzan el medio campo.
%%% 3) Aparición de las armas:
%%%	Al igual que los fantasmas, en este mapa pueden aparecer
%%%	hasta un máximo de 1 pistola aleatoriamente en uno de 
%%%	sus puntos de renacimiento (respawn points). Los respawns
%%%	de las armas están en la parte central, concretamente
%%%	en las posiciones (11,6) y (18,6)
%%% 4) Arquero automático:
%%%	Aparecen 1 arquero automático a la derecha del mapa al 
%%%	comienzo de la partida. La fila en que aparecen este 
%%%	arquero es siempre aleatoria. Además, el arquero dispara
%%%	con una frecuencia que se establece aleatoriamente al 
%%%	comienzo de la partida. Esta frecuencia es de un disparo 
%%%	cada 3 a 7 ciclos de ejecución.
%%%
%%% El resto de elementos del mapa son deterministas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(combiner).
load_behaviour(gunBasic).
load_behaviour(spiderGhost).
load_behaviour(respawnPoint).
load_behaviour(automaticArcher).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '#', '#', ' ', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', ' ', '#'],
['#', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '#', ' ', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(29, 11).
num_dots(191).
pacman_start(14, 5).
initMap:- 
	addSolidObject('#'),
	
	% Automatic Archer
	createGameEntity(OID_0, '(', object, 27, rnd(1,9), active, combiner([automaticArcher, enemyBasicMovement]), 
			[name(arquero1), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]), 
	enemyBasicMovement(init, OID_0, down-up, ['#']),
	randomBetween(3,8,D1), 
	automaticArcher(init, OID_0, ['@'], left, D1, [ continuous, bullet_appearance('<', bold, red, default) ]),

	% Ghost Respawns
	createGameEntity(OID_GR1, '', non_interactive, 5, 3, inactive, norule, 
			[name(respawn_de_fantama1), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen fantasmas'), appearance(attribs(normal, default, default))]), 
	createGameEntity(OID_GR2, '', non_interactive, 4, 7, inactive, norule, 
			[name(respawn_de_fantama2), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen fantasmas'), appearance(attribs(normal, default, default))]),
	respawnPoint(init, [OID_GR1, OID_GR2], 2, 
		[ app('F'), name(fantasma), crule(spiderGhost), appearance(attribs(normal, red, default)) ],
		[ EID, 'pl-man':spiderGhost(init, EID, ['#'], [ ] ) ], [ probRespawn(100) ] ),

	% Weapon Respawn
	createGameEntity(OID_WR1, '', non_interactive, 11, 6, active, norule, 
			[name(respawn_de_arma1), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen armas'), appearance(attribs(normal, default, default))]), 
	createGameEntity(OID_WR2, '', non_interactive, 18, 6, active, norule, 
			[name(respawn_de_arma2), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen armas'), appearance(attribs(normal, default, default))]), 
	respawnPoint(init, [OID_WR1, OID_WR2], 1, 
		[ app('l'), name(pistola), use_rule(gunBasic), description('Pistola con 3 balas'), 
		  active(inactive), type(object), appearance(attribs(bold, cyan, default)) ],
		[ OID, 'pl-man':gunBasic(init, OID, 3, [ 'F', 'l', '<' ], destroy) ], [ probRespawn(250) ] ).

norule(_).
norule(_,_,_,_,_).
