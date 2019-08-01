string_lower_sort(Word, SortedLoweredLetters) :-
  string_lower(Word, LoweredWord),
  string_to_list(LoweredWord, LoweredLetters),
  msort(LoweredLetters, SortedLoweredLetters).

anagram(Word, Options, Matching) :-
  string_lower_sort(Word, SortedLetters),
  check(SortedLetters, Options, Matching).

check(_SortedWord, [], Matching).

check(SortedWord, [Option | RemOptions], Matching) :-
  string_lower_sort(Option, SortedOption),
  SortedWord = SortedOption,
  !,
  check(SortedWord, RemOptions, [Option | Matching]).

check(SortedWord, [Option | RemOptions], Acc) :-
  check(SortedWord, RemOptions, Acc).