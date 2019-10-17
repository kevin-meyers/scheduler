class('bew1.1').
class('cs1.1').
class('spd1.1').
class('ql1.1').

day(monday). /* Swap to time-day slots for super easy overlay checking*/
day(tuesday).
day(wednesday).
day(thursday).
day(friday).

timerange([1330, 1500]). /* Swap these to time slots for simplicity. */
timerange([1530, 1700]).

classtime('bew1.1', day(monday), timerange(1330)).
classtime()

daytime(Day, Range) :- day(Day), timerange(Range).

list_nonmember(Xs,E) :-
       maplist(dif(E),Xs).

none_intersect(Xs,Ys) :-
       maplist(list_nonmember(Ys),Xs).

valid(X, Y) :- 
	X = daytime(Day1, Range1),
	Y = daytime(Day2, Range2),
	call(X),
	call(Y),
	none_intersect(Range1, Range2); \+ (Day1 = Day2).


