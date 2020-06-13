#!/bin/sh

test_success_raw() {
  output=$(echo "$1" "$2" "$3" | $APP)
  test "$output" = "$4"
}

test_success() {
  test_success_raw "$1" "$2" "$3" "$4"
  test_success_raw "$1" "$3" "$2" "$4"
  test_success_raw "$3" "$1" "$2" "$4"
  test_success_raw "$3" "$2" "$1" "$4"
  test_success_raw "$2" "$3" "$1" "$4"
  test_success_raw "$2" "$1" "$3" "$4"
}

test_fail_raw() {
  if output=$(echo "$1" "$2" "$3" | $APP 2>/dev/null); then
	echo "Test $1 $2 $3 must fail"
	exit 1
  else
	test -z "$output"
  fi
}

test_fail() {
  test_fail_raw "$1" "$2" "$3"
  test_fail_raw "$1" "$3" "$2"
  test_fail_raw "$3" "$1" "$2"
  test_fail_raw "$3" "$2" "$1"
  test_fail_raw "$2" "$3" "$1"
  test_fail_raw "$2" "$1" "$3"
}

APP="$1"

set -e

test_fail 0 0 0

test_success 1 1 1 "Равносторонний треугольник"
test_success 100 100 100 "Равносторонний треугольник"

test_fail 1 1 100
test_success 3 4 5 "Обычный треугольник"

echo "Все тесты успешно прошли"
