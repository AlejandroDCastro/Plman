%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	3
%%% PT:	00:30	[STS: 01:45]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- dynamic d_balls/1.

map_format_version(1.0).
load_behaviour(launchBall).
load_behaviour(soccerGoal).
load_behaviour(entitySequentialMovement).
load_behaviour(gunBasic).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '#', ' ', '#', '#', '#', '#', '#', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '.', '.', '#', '#', '#', '#', '.', '#'],
['#', '#', '#', '#', '#', '.', '.', '.', '.', '.', '#', '#', '#', '#', '#'],
['#', '#', '#', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', '#', '#', '#'],
['#', '#', '#', '/', ' ', ' ', '.', '.', '.', ' ', ' ', '\\', '#', '#', '#'],
['#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', ' ', '.', ' ', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', ' ', '#', '#', '#', '#', '#', '#', '#']]).
map_size(15, 10).
num_dots(49).
pacman_start(7, 8).
initMap:- 
	addSolidObject('#'), 
	addSolidObject('/'), 
	addSolidObject('\\'), 
	% Nets and scoreboard
	createGameEntity(OID_G1, '_', object, 4, 5, inactive, norule, 
			[name('Red [1]'), solid(true), static(true), use_rule(norule),
			 description('Red de la porteria'), appearance(attribs(bold, yellow, default))]),
	createGameEntity(OID_G2, '_', object, 5, 5, inactive, norule, 
			[name('Red [2]'), solid(true), static(true), use_rule(norule),
			 description('Red de la porteria'), appearance(attribs(bold, yellow, default))]),
	createGameEntity(OID_G3, '_', object, 6, 5, inactive, norule, 
			[name('Red [3]'), solid(true), static(true), use_rule(norule),
			 description('Red de la porteria'), appearance(attribs(bold, yellow, default))]),
	createGameEntity(OID_G4, '_', object, 7, 5, inactive, norule, 
			[name('Red [4]'), solid(true), static(true), use_rule(norule),
			 description('Red de la porteria'), appearance(attribs(bold, yellow, default))]),
	createGameEntity(OID_G5, '_', object, 8, 5, inactive, norule, 
			[name('Red [5]'), solid(true), static(true), use_rule(norule),
			 description('Red de la porteria'), appearance(attribs(bold, yellow, default))]),
	createGameEntity(OID_G6, '_', object, 9, 5, inactive, norule, 
			[name('Red [6]'), solid(true), static(true), use_rule(norule),
			 description('Red de la porteria'), appearance(attribs(bold, yellow, default))]),
	createGameEntity(OID_G7, '_', object, 10, 5, inactive, norule, 
			[name('Red [7]'), solid(true), static(true), use_rule(norule),
			 description('Red de la porteria'), appearance(attribs(bold, yellow, default))]),
	createGameEntity(OID_SB, '0', object, 7, 9, active, soccerGoal, 
			[name('Marcador'), solid(true), static(true), use_rule(norule),
			 description('Marcador de goles'), appearance(attribs(bold, yellow, default))]),
	% Gun
	createGameEntity(OID_GUN, 'l', object, 9, 8, inactive, norule, 
			[name(derringer), solid(false), static(false), use_rule(gunBasic),
			 description('Pistola con 1 sola bala. Usala bien.'), appearance(attribs(bold, red, default))]),
	% Enemies
	createGameEntity('E', mortal, 7, 2, active, norule, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_2, 'E', mortal, 5, 6, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_3, 'E', mortal, 9, 6, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	% Behaviours	
	gunBasic(init, OID_GUN, 1, ['E'], keep),
	launchBall(autoBallCreator, 1, 5, 1, 8),
	soccerGoal(init, OID_SB, 4, ['o'], [OID_G1, OID_G2, OID_G3, OID_G4, OID_G5, OID_G6, OID_G7], []),
	entitySequentialMovement(init, EID_2, [r,r,n,r,r,r,l,l,l,n,l,l,l,r], [no_repeat_moves]),
	entitySequentialMovement(init, EID_3, [l,l,l,l,l,n,n,r,r,n,r,r,n,r,r,n,n,l], [no_repeat_moves]).
norule(_).
norule(_,_,_,_,_).
