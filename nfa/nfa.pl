reachable(StartState, FinalState, []) :-
    StartState = FinalState.

reachable(StartState, FinalState, [InputH | InputT]) :-
    transition(StartState, NextState, InputH),
    reachable(NextState, FinalState, InputT).
