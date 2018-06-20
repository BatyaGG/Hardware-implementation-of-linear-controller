# Improving transient and steady state behavior of second order RLC circuit system.

RLC circuit is a circuit containing resistors, capacitors and inductors. Resistor is a linear element which’s aim is to drop potential, capacitor and inductor are nonlinear elements which stores energy in electric and magnetic fields respectively. Behavior of these elements for step input is easily predictable, but combination of such elements needs some mathematical analysis, especially when we are given some specifications for it. The aim is to improve steady state error and transient response of the RLC circuit for step input using feedback control combination.

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/plant.png">
  <br>
  <i>Figure 1: Circuit diagram of Plant</i>
</p>

The transfer function of our plant is the following:

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/plant_transfer_function.png">
</p>

Where we choose R = 991Ohms, C = 47nF and L = 33mH.

So, final transfer function of process is H(s) = 991 / (1.537 * 10<sup>-6</sup>s<sup>2</sup> + 0.033s + 991)

Open loop step response of this system has 23.1% overshoot and 0 steady state error, however, this is an ideal mathematical case. In practice, energy loss and process random disturbance is not controlled, and the real step response will behave in not appropriate way.

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/step_plant.png">
  <br>
  <i>Figure 2: Theoretical step response of an open loop plant</i>
</p>

Let’s compare it with what we got from practical circuit implementation step response:

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/step_plant_real.png">
  <br>
  <i>Figure 3: Practical step response of an open loop plant</i>
</p>

It can be seen that percent overshoot of practical plant is as predicted by Matlab, but we can see that the steady state value is 4.56V which means 9% error since we are giving 5V input step. Our aim is to improve transient and steady state response of the system. Incidentally during this project, we found huge discrepancy in rise and
settling times of practical and theoretical systems, even for simple open loop process step response we have more than 10 times difference (may be because of oscilloscope improper calibration or fritz). So, our practical rise and settling time does not match to our calculations.

To improve practical step behavior of the system we implemented feedback using operational amplifiers LM741. The step responses of the feedback system with unity proportional controller are shown below.

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/step_plant_closed.png">
  <br>
  <i>Figure 4: Theoretical step response of closed loop plant</i>
</p>

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/step_plant_closed_real.png">
  <br>
  <i>Figure 5: Practical step response of closed loop plant</i>
</p>

As it was predicted in Matlab, error is 50% for practical feedback system step response. Our next step is to improve steady state error and preserve good transient behavior of the system. We will use Root Locus Analysis and Bode plot approach to design 2 different controllers for same specifications.

## Root Locus Analysis

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/root_locus_p1.png">
</p>
