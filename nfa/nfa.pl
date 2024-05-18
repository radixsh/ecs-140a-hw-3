reachable(StartState, FinalState, []) :-
    StartState = FinalState.

reachable(StartState, FinalState, [InputH | InputT]) :-
    transition(StartState, InputH, NextStateSet),
    reachable(NextState, FinalState, InputT),
    member(NextState, NextStateSet).
