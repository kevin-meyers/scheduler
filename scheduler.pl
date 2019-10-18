member(X,[X|_]).
member(X,[_|T]) :- member(X,T).
 
scheduler(ClassList, L) :- 
	makeList(L, ClassList), different(L).


makeList([],[]):- !.
makeList([course(Class,Time)|Rest], [Class|Classes]) :- 
    course(class(Class), time(Time)),
    makeList(Rest, Classes).
 
course(class('cs1.1'), time(1)).
course(class('cs1.1'), time(2)).
course(class('bew1.1'), time(1)).
course(class('ql1.1'), time(1)).
 
 
different([_]).
different([course(_,Time)|Rest]) :- 
    member(course(_,Time),Rest), 
    !, fail.
different([_|T]) :- different(T).
