# Robot Interception Simulation

## Overview
This project implements a velocity-constrained guidance algorithm for autonomous interception of a dynamically maneuvering target.

At each time step, the robot computes a feasible velocity based on line-of-sight (LOS) direction and acceleration limits. The method ensures physically realizable motion while maintaining convergence toward the target.

--

## Simulation

The following figures illustrate the evolution of the interception process in both state space and velocity space.

--

#### I - Trajectory Evolution

  ![Interception Simulation](results/interception_simulation.gif)

  Figure 1: Global evolution of robot and target trajectories over time.

#### II - Interception Phase with Velocity Space Representation

  ![Interception Simulation](results/interception_simulation_FVR.gif)

  Figure 2: Close-up view showing convergence of the robot toward the target.

--

## Method

### Line-of-Sight Guidance
The desired velocity is aligned with the relative position vector between the robot and target.

### Acceleration Constraints
The robot is subject to bounded acceleration, which defines a Feasible Velocity Region (FVR) at each time step.

### Velocity Selection
- If the desired velocity lies within the FVR, it is applied directly.
- Otherwise, the closest feasible velocity within the FVR is selected.

--

## Features

- Dynamic target motion (sinusoidal and perturbed trajectory)
- Real-time trajectory tracking
- Feasible Velocity Region (FVR) visualization
- Constraint-aware velocity planning

--

## Results

The robot successfully converges to the target trajectory and achieves interception within a specified capture radius while respecting acceleration constraints.

--

## Implementation

- MATLAB
- Discrete-time simulation
- Velocity-based motion planning

---
