alias twm='Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome'
alias dim='xrandr --output LVDS-1 --brightness 0.6'
alias bright='xrandr --output LVDS-1 --brightness 0.9'
alias blender='export CYCLES_OPENCL_TEST=ALL && cd ~/software/blender-2-exec/ && DRI_PRIME=1 ./blender'
alias ros_start='echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc && source ~/.bashrc'
alias ros_end="sed -i '/melodic/d' ~/.bashrc && sed -i '/TURTLEBOT3_MODEL/d' ~/.bashrc"
alias devel='source ~/catkin_ws/devel/setup.bash'
alias ros_make='cd ~/catkin_ws && catkin_make && cd -'
