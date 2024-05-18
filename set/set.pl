% File must start with a comment to be interpreted as Prolog not Perl 
% https://stackoverflow.com/questions/19610734/prolog-support-for-vim-users#19611055

% If Set1 and Set2 are not disjoint sets, then the union will have duplicates.
isUnion([Set1H | Set1T], Set2, Union) :-
    isUnion(Set1T, Set2, TempUnion),
    add(Set1H, TempUnion).

add(X, L, L) :-
    member(X, L), !.
add(X, L, [X|L]).


% Doesn't detect cases where the 3rd parameter (an array) is missing some
% elements the sets share.
isIntersection([], [], []).
isIntersection(Set1, Set2, Intersection) :- 
    member(Element, Set1),
    member(Element, Set2),
    append([], Element, Intersection).

isEqual([], []).
isEqual(Set1,Set2) :-
    length(Set1, Length),
    length(Set2, Length),
    contains(Set1, Set2).

contains([], _).
contains([Set1H | Set1T], Set2) :-
    member(Set1H, Set2),
    contains(Set1T, Set2).
