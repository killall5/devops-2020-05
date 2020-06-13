#!/bin/bash

#===============================================================================
#
#           FILE:        triangle.sh
#
#          USAGE:        ./triangle.sh -a arg1 -b  arg2 -c arg3
#
#    DESCRIPTION:        This script is used to determine the
#                        type of triangle using three sides.
#
#        OPTIONS:
#               -a,-A   Triangle side A, integer
#               -b,-B   Triangle side B, integer
#               -c,-C   Triangle side C, integer
#
#   REQUIREMENTS:  ---
#           BUGS:  ---
#          NOTES:  Leaning DevOps
#
# IMPLEMENTATION:
#             VERSION   0.0.1
#              AUTHOR   Vadim Glushkov, vadim.glushkov@nskes.ru
#           COPYRIGHT   AO Novosibirskenergosbyt
#             LICENSE   MIT
#
#        HISTORY:
#          2020/06/08 : glushkovvv : script creation
#          2015/06/09 : glushkovvv : script change
#
#===============================================================================

#Help usage
help_usage()
{
    echo "Usage:"
    echo "   $0 -a arg1 -b arg2 -c arg3"
    echo "OPTIONS:"
    echo "   -a,-A   Triangle side A, integer"
    echo "   -b,-B   Triangle side B, integer"
    echo "   -c,-C   Triangle side C, integer"
}

#Error exit
err_exit()
{
    help_usage
    exit 1
}

#Check count arguments
check_count_arg()
{
    if [ $1 -ne 6 ]
    then
        echo "The number of arguments is not as demanded."; err_exit
    fi
}

#Check type triangle
check_type_triangle()
{
    array=()
    array+=($1)
    array+=($2)
    array+=($3)
    IFS=$'\n' array_sorted=($(sort <<<"${array[*]}")); unset IFS
    check_possible=$((${array_sorted[2]}-${array_sorted[1]}-${array_sorted[0]}))
    echo $check_possible
    if [ $check_possible -ge 0 ]
    then
	echo "not possible to build a triangle"; err_exit
    fi
    check_type=$((${array_sorted[2]}*${array_sorted[2]}-${array_sorted[1]}*${array_sorted[1]}-${array_sorted[0]}*${array_sorted[0]}))
    if [ $check_type -eq 0 ]
    then
        echo "right-angled triangle"; exit 0
    fi
    if [ $check_type -gt 0 ]
    then
	echo "obtuse-angled triangle"; exit 0
    fi
    echo "acute-angled triangle"; exit 0
    echo ${array_sorted[@]}
}


#Check argument is integer and not None
is_int()
{
    echo "int $1"
}

check_count_arg $#

while [ $# -gt 0 ]
 do
    case $1 in
        -a|-A) is_int $2; side_a="$2"; shift ;;
        -b|-B) side_b="$2"; shift ;;
        -c|-C) side_c="$2"; shift ;;
        *) echo "Unknown options passed: $1"; err_exit ;;
    esac
    shift
done

check_type_triangle $side_a $side_b $side_c

echo "$side_a"
echo "$side_b"
echo "$side_c"