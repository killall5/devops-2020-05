#!/bin/sh -e

read a b c

a_gt_0=$(echo "$a > 0" | bc)
b_gt_0=$(echo "$b > 0" | bc)
c_gt_0=$(echo "$c > 0" | bc)

if [ $a_gt_0 -eq 0 -o $b_gt_0 -eq 0 -o $c_gt_0 -eq 0 ]; then
	echo "Числа должны быть больше 0" >&2
	exit 1
fi

ab_gt_c=$(echo "$a+$b > $c" | bc)
bc_gt_a=$(echo "$b+$c > $a" | bc)
ac_gt_b=$(echo "$a+$c > $b" | bc)

if [ $ab_gt_c -eq 0 -o $bc_gt_a -eq 0 -o $ac_gt_b -eq 0 ]; then
	echo "Числа $a $b $c не могут быть сторонами треугольника" >&2
	exit 2
fi

if [ $a = $b -a $b = $c ]; then
	echo "Равносторонний треугольник"
else
	echo "Обычный треугольник"
fi
