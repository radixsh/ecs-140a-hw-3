% File must start with a comment to be interpreted as Prolog not Perl 
% https://stackoverflow.com/questions/19610734/prolog-support-for-vim-users#19611055

% If Set1 and Set2 are not disjoint sets, then the union will have duplicates.
isUnion(Set1, Set2, Union) :-
    append(Set1, Set2, Union).



% Doesn't detect cases where the 3rd parameter (an array) is missing some
% elements the sets share.
isIntersection([], [], []).
isIntersection(Set1, Set2, Intersection) :- 
    member(Element, Set1),
    member(Element, Set2),
    append([], Element, Intersection).
% isInBoth(Set1, Set2, T).

% isInBoth(_1, _2, []).
% isInBoth(Set1, Set2, [H|T]) :-
%     member(H, Set1),
%     member(H, Set2),
%     isInBoth(Set1, Set2, T).



isEqual([], []).
isEqual(Set1,Set2) :-
    length(Set1, Length),
    length(Set2, Length),
    contains(Set1, Set2).

contains([], _).
contains([Set1H | Set1T], Set2) :-
    member(Set1H, Set2),
    contains(Set1T, Set2).
