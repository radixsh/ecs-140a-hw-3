% File must start with a comment to be interpreted as Prolog not Perl 
% https://stackoverflow.com/questions/19610734/prolog-support-for-vim-users#19611055

isUnion([], Set2, Set2).
isUnion([H|T], Set2, Union) :-
    isUnion(T, Set2, TempUnion),
    add(H, TempUnion, Union).

add(Element, Set, Set) :-
    member(Element, Set).
add(Element, Set, [Element | Set]).


isIntersection([], _, []).
isIntersection(_, [], []).
isIntersection([H|T], Set2, Intersection) :- 
    isIntersection(T, Set2, TempIntersection),
    member(H, Set2), 
    add(H, TempIntersection, Intersection).
isIntersection(Set1, [H|T], Intersection) :- 
    isIntersection(Set1, T, TempIntersection),
    member(H, Set1), 
    add(H, TempIntersection, Intersection).


isEqual([], []).
isEqual(Set1,Set2) :-
    length(Set1, Length),
    length(Set2, Length),
    contains(Set1, Set2).

contains([], _).
contains([Set1H | Set1T], Set2) :-
    member(Set1H, Set2),
    contains(Set1T, Set2).
