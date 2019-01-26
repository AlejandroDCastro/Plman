%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	00:45	[STS: 02:50]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(launchBall).
load_behaviour(soccerGoal).
load_behaviour(enemyBasicMovement).
load_behaviour(entitySequentialMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', ' ', '#', '#', '#', '#', '#', ' ', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '*', '-', '-', '-', '-', '-', '.', '.', '.', '.', '.', '|', '.', '.', '.', '.', '.', '-', '-', '-', '-', '-', '*', '.', ' ', '#'],
['#', '.', '.', ' ', ' ', '.', '.', '.', '|', '.', '.', '.', '.', '.', '|', '.', '.', '.', '.', '.', '|', '.', '.', '.', ' ', ' ', '.', '.', '#'],
['#', '.', '.', ' ', ' ', '.', '.', '.', '|', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '|', '.', '.', '.', ' ', ' ', '.', '.', '#'],
['#', '.', '.', ' ', ' ', '.', '.', '.', '|', '.', '.', '.', '.', ' ', '|', '.', '.', '.', '.', '.', '|', '.', '.', '.', ' ', ' ', '.', '.', '#'],
['#', '.', '.', '*', '-', '-', '-', '-', '-', '.', '.', '.', '.', '.', '|', '.', '.', '.', '.', '.', '-', '-', '-', '-', '-', '*', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(29, 7).
num_dots(85).
pacman_start(13, 4).
initMap:- 
	addSolidObject('#'), 
	addSolidObject('*'), 

	% SOCCER GOAL 1
	createGameEntity(OID_RL1, ':', object, 3, 2, inactive, norule, 
			[name(red1_1), solid(true), static(true), use_rule(norule),
			description('Red de la porteria local'), appearance(attribs(normal, black, cyan))]), 
	createGameEntity(OID_RL2, ':', object, 3, 3, inactive, norule, 
			[name(red1_2), solid(true), static(true), use_rule(norule),
			description('Red de la porteria local'), appearance(attribs(normal, black, cyan))]), 
	createGameEntity(OID_RL3, ':', object, 3, 4, inactive, norule, 
			[name(red1_3), solid(true), static(true), use_rule(norule),
			description('Red de la porteria local'), appearance(attribs(normal, black, cyan))]), 
	createGameEntity(OID_ML, 0, object, 11, 0, active, soccerGoal, 
			[name(marcador_local), solid(true), static(true), use_rule(norule),
			description('Marcador de goles recibidos por el equipo local'), appearance(attribs(bold, cyan, green))]), 
	soccerGoal(init, OID_ML, 1, ['o', 'O'], [OID_RL1, OID_RL2, OID_RL3], []),

	% SOCCER GOAL 2
	createGameEntity(OID_RV1, ':', object, 25, 2, inactive, norule, 
			[name(red2_1), solid(true), static(true), use_rule(norule),
			description('Red de la porteria visitante'), appearance(attribs(normal, black, yellow))]), 
	createGameEntity(OID_RV2, ':', object, 25, 3, inactive, norule, 
			[name(red2_2), solid(true), static(true), use_rule(norule),
			description('Red de la porteria visitante'), appearance(attribs(normal, black, yellow))]), 
	createGameEntity(OID_RV3, ':', object, 25, 4, inactive, norule, 
			[name(red2_3), solid(true), static(true), use_rule(norule),
			description('Red de la porteria visitante'), appearance(attribs(normal, black, yellow))]), 
	createGameEntity(OID_MV, 0, object, 17, 0, active, soccerGoal, 
			[name(marcador_visitante), solid(true), static(true), use_rule(norule),
			description('Marcador de goles recibidos por el equipo visitante'), appearance(attribs(normal, yellow, green))]), 
	soccerGoal(init, OID_MV, 1, ['o', 'O'], [OID_RV1, OID_RV2, OID_RV3], []),

	% BALLS
	createGameEntity(OID_B1, 'O', object, 1, 1, active, launchBall, 
			[name(pelota_inflada_1), solid(false), static(false), use_rule(launchBall),
			description('Pelota que puede ser lanzada a puerta'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_B2, 'O', object, 27, 1, active, launchBall, 
			[name(pelota_inflada_2), solid(false), static(false), use_rule(launchBall),
			description('Pelota que puede ser lanzada a puerta'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_B3, 'o', object, 14, 3, active, launchBall, 
			[name(pelota_desinflada), solid(false), static(false), use_rule(launchBall),
			description('Pelota que puede ser lanzada a puerta'), appearance(attribs(bold, cyan, default))]), 
	launchBall(init, OID_B1, []),	
	launchBall(init, OID_B2, []),	
	launchBall(init, OID_B3, []),	

	% GOALKEEPERS
	createGameEntity(EID_0, 'E', mortal, 4, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_3, 'E', mortal, 24, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [ u, r, d, d, l, u, r, r, r, l, l, l ], [ no_repeat_moves ]),
	entitySequentialMovement(init, EID_3, [ d, l, u, u, r, d, l, l, l, r, r, r ], [ no_repeat_moves ]),

	% DEFENDERS
	createGameEntity(EID_1, 'E', mortal, 9, 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_2, 'E', mortal, 19, 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	enemyBasicMovement(init, EID_1, up-down, ['#']),
	enemyBasicMovement(init, EID_2, down-up, ['#']).

norule(_).
norule(_,_,_,_,_).
