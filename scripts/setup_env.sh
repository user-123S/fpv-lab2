#!/bin/bash
# Common environment for lab 2. Source it, do not execute it:
#   source ~/fpv_labs/scripts/setup_env.sh
#
# Sourcing ardu_ws/install/setup.bash also runs the ament environment
# hooks of ardupilot_gazebo, which set GZ_SIM_RESOURCE_PATH,
# GZ_SIM_PLUGIN_PATH and SDF_PATH automatically.

export GZ_VERSION=harmonic
export PATH=$HOME/ardu_ws/Micro-XRCE-DDS-Gen/scripts:$PATH

source /opt/ros/jazzy/setup.bash
source $HOME/ardu_ws/install/setup.bash

if [ -f "$HOME/fpv_labs/install/setup.bash" ]; then
    source $HOME/fpv_labs/install/setup.bash
fi

# Models for Gazebo spawn and for sdformat_urdf (robot_state_publisher).
# Without these paths /robot_description is never published and iris never
# appears in the maze.
MODELS_DESC=$HOME/ardu_ws/install/ardupilot_gz_description/share/ardupilot_gz_description/models
MODELS_AP=$HOME/ardu_ws/install/ardupilot_gazebo/share/ardupilot_gazebo/models
export GZ_SIM_RESOURCE_PATH=$MODELS_DESC:$MODELS_AP:${GZ_SIM_RESOURCE_PATH}
export SDF_PATH=$MODELS_DESC:$MODELS_AP:${SDF_PATH}
export LIBGL_ALWAYS_SOFTWARE=1
