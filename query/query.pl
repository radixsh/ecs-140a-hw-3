/* All novels published during the year 1953 or 1996*/
year_1953_1996_novels(Book) :-
    novel(Book, Year),
    (Year = 1953; Year = 1996).

/* List of all novels published during the period 1800 to 1900*/
period_1800_1900_novels(Book) :-
    novel(Book, Year),
    Year >= 1800,
    Year =< 1900.

/* Characters who are fans of LOTR */
lotr_fans(Fan) :-
    fan(Fan, Titles),
    member(the_lord_of_the_rings, Titles).

any_in(First, Second) :-
    member(Thing, First),
    member(Thing, Second).

/* Authors of the novels owned by Chandler */
author_names(Author) :-
    author(Author, Written),
    fan(chandler, Titles),
    any_in(Written, Titles).

/* Characters who are fans of Brandon Sanderson's novels */
fans_names(Fan) :-
    fan(Fan, Titles),
    (member('mistborn_trilogy', Titles); member('the_way_of_kings', Titles)).

/* Novels common between either of Phoebe, Ross, and Monica */
mutual_novels(Book) :-
    (fan(phoebe, P_titles), fan(ross, R_titles), 
        member(Book, P_titles), member(Book, R_titles));
    (fan(phoebe, P_titles), fan(monica, M_titles), 
        member(Book, P_titles), member(Book, M_titles));
    (fan(ross, R_titles), fan(monica, M_titles), 
        member(Book, R_titles), member(Book, M_titles)).
