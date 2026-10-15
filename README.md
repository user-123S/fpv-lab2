# FPV Lab 2 — Gazebo + ArduPilot SITL + ROS 2

Варіант **22**: Δx = 5.2 м, Δy = 1.4 м.

Політ до точки `(x0 + 5.2, y0 + 1.4)` і автоматична посадка.
Результат прогону: фактична позиція `(5.078, 1.368)`, похибка **e = 0.127 м**.

## Запуск (Ubuntu / WSL)

Термінал 1:

```bash
cd ~/fpv_labs
./scripts/start_sim.sh
```

Термінал 2:

```bash
cd ~/fpv_labs
source /opt/ros/jazzy/setup.bash
source install/setup.bash
./scripts/run_variant_22.sh
```

Зупинка: `Ctrl+C` або `./scripts/stop_sim.sh`.
