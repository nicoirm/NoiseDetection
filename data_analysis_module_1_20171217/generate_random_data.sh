#!/bin/bash



for i in `seq 1 100` # here for repeting the diceroll
do

# gives figure from 1 to $max
max=100
# echo $((`cat /dev/urandom|od -N1 -An -i` % $max +1)) 
seq 80 100 | shuf -n1

done

