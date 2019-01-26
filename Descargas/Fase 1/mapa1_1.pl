%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	3
%%% PT:	00:08	[STS: 00:24]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '#'],
['#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', ' ', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', ' ', '#'],
['#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', ' ', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', ' ', '#'],
['#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', ' ', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', ' ', '#'],
['#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', ' ', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', ' ', '#'],
['#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', ' ', ' ', ' ', ' ', '.', '.', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', ' ', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', ' ', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(32, 11).
num_dots(62).
pacman_start(1, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity('F', mortal, 19, 6, active, vigilaFantasma1, [ appearance(attribs(normal, red, default)) ] ), 
	createGameEntity('E', mortal, 30, 6, active, vigilaFantasma2, [ appearance(attribs(normal, red, default)) ] ),
	retractall(next_movement1(_,_)),
	retractall(next_movement2(_,_)).
norule(_).
norule(_,_,_,_,_).

:-dynamic next_movement1/2.
:-dynamic next_movement2/2.


vigilaFantasma1(EID):-
	not(next_movement1(EID, _)),
	assert(next_movement1(EID, right)),!.

vigilaFantasma1(EID):-
	next_movement1(EID, X),
	(
	 X=right,
	 see(EID,normal,X,'#')
	 ->
	  retractall(next_movement1(EID, _)),
	  assert(next_movement1(EID, left)),
	  asserta(d_doAction(EID,move(left)))
	 ;	
	 (
	  X=left,
	  see(EID,normal,X,'#')
	  ->
	   retractall(next_movement1(EID, _)),
	   assert(next_movement1(EID, right)),
	   asserta(d_doAction(EID,move(right)))
	 )
	 ;
	 (
	  asserta(d_doAction(EID,move(X)))
	 )).
	

vigilaFantasma2(EID):-
	not(next_movement2(EID, _)),
	assert(next_movement2(EID, left)),!.

vigilaFantasma2(EID):-
	next_movement2(EID, X),
	(
	 X=right,
	 see(EID,normal,X,'#')
	 ->
	  retractall(next_movement2(EID, _)),
	  assert(next_movement2(EID, left)),
	  asserta(d_doAction(EID,move(left)))
	 ;	
	 (
	  X=left,
	  see(EID,normal,X,'#')
	  ->
	   retractall(next_movement2(EID, _)),
	   assert(next_movement2(EID, right)),
	   asserta(d_doAction(EID,move(right)))
	 )
	 ;
	 (
	  asserta(d_doAction(EID,move(X)))
	 )).
	

