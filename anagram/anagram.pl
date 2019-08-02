% Written for SWIPL 8.0.3

% take a string, and a list of string options, return the matching
% words that are anagrams
anagram(Word, Options, Matching) :-
  string_lower_sort(Word, SortedWord),
  check(Word, SortedWord, Options, [], ReversedMatching),
  reverse(ReversedMatching, Matching).

% check - recursive base case, cut all options after matching to this.
check(_Word, _SortedWord, [], Matching, Matching) :-
  !.

% check - check option to word, if matches, cut, accumulate results
check(Word, SortedWord, [Option | RemOptions], Acc, Matching) :-
  string_lower_sort(Option, SortedOption),
  SortedWord = SortedOption,
  distinct_from_word(Word, Option),
  unique_from_list(Option, Acc),
  !,
  check(Word, SortedWord, RemOptions, [Option | Acc], Matching).

% check - if matches, option was not an anagram, recurse on remaining
check(Word, SortedWord, [_Option | RemOptions], Acc, Matching) :-
  check(Word, SortedWord, RemOptions, Acc, Matching).

% take a string, lower case it, make it to a list, sort the list
string_lower_sort(Word, SortedLoweredLetters) :-
  string_lower(Word, LoweredWord),
  string_to_list(LoweredWord, LoweredLetters),
  msort(LoweredLetters, SortedLoweredLetters).

% make sure that an option isnt the same as the word
distinct_from_word(Word, Option) :-
  string_lower(Word, LowerWord),
  string_lower(Option, LowerOption),
  \+ (LowerWord = LowerOption).

% check if a string is unique in a list, check case insensitively
unique_from_list(Word, ListOfWords) :-
  string_lower(Word, LowerWord),
  maplist(string_lower, ListOfWords, LowerListOfWords),
  \+ member(LowerWord, LowerListOfWords).