#!/bin/bash

for test_file in *_tests.plt
do
  sed -i 's/(pending/(true/g' "$test_file";
done

swipl -f spiral_matrix.pl -s spiral_matrix_tests.plt -g run_tests,halt -t 'halt(1)'