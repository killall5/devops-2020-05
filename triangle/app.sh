#!/bin/bash

read a b c

if [ $a -le 0 -o $b -le 0 -o $c -le 0 ]; then
	echo "Числа должны быть больше 0" >&2
	exit 1
fi

let ab=$a+$b
let bc=$b+$c
let ac=$a+$c

if ! [ $ab -gt $c -a $bc -gt $a -a $ac -gt $b ]; then
	echo "Числа $a $b $c не могут быть сторонами треугольника" >&2
	exit 2
fi

if [ $a -eq $b -a $b -eq $c ]; then
	echo "Равносторонний треугольник"
else
	echo "Обычный треугольник"
fi
