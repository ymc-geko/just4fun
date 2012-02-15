#!/bin/bash

echo "$(date +%T)"
taskset 01 echo "cpu 1" && ./stress.sh &
taskset 02 echo "cpu 2" && ./stress.sh & 
taskset 03 echo "cpu 3" && ./stress.sh & 
taskset 04 echo "cpu 4" && ./stress.sh & 

echo "finished at $(date +%T)"
exit 0

