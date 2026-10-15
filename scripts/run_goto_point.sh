#!/bin/bash
# Task 4: fly to the individually assigned point and land.
# The simulation must already be running (./start_sim.sh).
#
# Usage:  ./run_goto_point.sh [delta_x] [delta_y] [axis_direction]
# Defaults are variant 22: Δx = 5.2 m, Δy = 1.4 m
# Example:  ./run_goto_point.sh
#           ./run_goto_point.sh 5.2 1.4
#
# axis_direction defaults to 1 (target = start + delta). Pass -1 to follow
# the formula of Appendix 2 literally (target = start - delta) - in the real
# maze.sdf that direction runs into a wall.

set -e
cd "$(dirname "$0")"
source ./setup_env.sh

DX=${1:-5.2}
DY=${2:-1.4}
DIR=${3:-1.0}

./wait_ready.sh 300

LOG=$HOME/fpv_labs/logs/goto_point_$(date +%Y%m%d_%H%M%S).log
mkdir -p "$(dirname "$LOG")"

echo "delta_x=$DX  delta_y=$DY  axis_direction=$DIR"
echo "Log file: $LOG"

ros2 run fpv_lab2 goto_point --ros-args \
    -p delta_x:=$DX \
    -p delta_y:=$DY \
    -p axis_direction:=$DIR 2>&1 | tee "$LOG"
