pascal(N, Rows) :-
  pascal(N, 0, [], Rows).

pascal(NGoal, NCurr, Acc, Rows) :-
  NCurr > NGoal,
  reverse(Acc, Rows).

pascal(NGoal, 0, Acc, Rows) :-
  pascal(NGoal, 1, Acc, Rows).

pascal(NGoal, NCurr, Acc, Rows) :-
  NCurr > 0,
  NCurr =< NGoal,
  get_row(NCurr, Acc, Row),
  NextNCurr is NCurr + 1,
  pascal(NGoal, NextNCurr, [Row | Acc], Rows).

get_row(1, Acc, [1]).
get_row(2, Acc, [1,1]).

get_row(N, )