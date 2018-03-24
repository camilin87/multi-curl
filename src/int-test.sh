#!/bin/sh

rm -Rf out && \
  mkdir out && \
  bundle exec ruby program.rb out resources/sample_input.txt && \
  echo `ls out` | grep 404 && \
  echo `ls out` | grep 416 && \
  echo `ls out` | grep 504

TEST_RESULT=$?

if [[ $TEST_RESULT == 0 ]]; then
  echo "SUCCESS"
else
  echo "FAIL"
  exit $TEST_RESULT
fi
