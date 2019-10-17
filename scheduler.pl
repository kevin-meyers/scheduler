class('bew1.1').
class('cs1.1').
class('spd1.1').
class('ql1.1').


/* Time-Day to labels. 
* Monday/Wednesday 9:30 - 11:20: 1
* Monday/Wednesday 1:30 - 3:20: 2
* Monday/Wednesday 3:30 - 5:20: 3
* Tuesday/Thursday 9:30 - 11:20: 4
* Tuesday/Thursday 1:30 - 3:20: 5
* Tuesday/Thursday 3:30 - 5:20: 6
* Friday 9:30 - 11:20: 7
* Friday 1:30 - 3:20: 8
* Friday 3:30 - 5:20: 9
 */

classtime(class('bew1.1'), time_slot(2)).
classtime(class('bew1.1'), time_slot(3)).
classtime(class('cs1.1'), time_slot(5)).
classtime(class('cs1.1'), time_slot(6)).
classtime(class('spd1.1'), time_slot(1)).

classtime(class('lab'), time_slot(X)) :- 
	between(1, 6, X).

valid(X, Y) :- 
	X = classtime(Class1, Time1),
	Y = classtime(Class2, Time2),

	call(X),
	call(Y),

	\+ (Class1 = Class2), \+ (Time1 = Time2).

maplist(valid(

/* As of right now my code will find pairs of classes that go together if you 
* query for valid.
*
* Need to allow user to query a relation like `choices([class names])` 
* which will search for classes that fit together within the time slot constraints with 
* no repeating classes.
* 
* Im thinking just looping over the incoming list of class names and finding classes that
* match by no overlapping time slot.
*/
