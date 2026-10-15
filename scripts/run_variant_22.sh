#!/bin/bash
# Lab 2, variant 22 (Appendix 2): Δx = 5.2 m, Δy = 1.4 m
# Simulation must already be running (./start_sim.sh).

set -e
cd "$(dirname "$0")"
exec ./run_goto_point.sh 5.2 1.4 "$@"
