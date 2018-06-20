# Improving transient and steady state behavior of second order RLC circuit system.

The second order RLC circuit plant has 

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/plant_transfer_function_real.png">
</p>

transfer function.

The plant's transient and steady state behaviour was finally compensated by 

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/final_controller_transfer_function.png">
</p>

feedback controller.

Compensated vs Uncompensated comparison plots of final system is shown below. The process of designing the final controller is explained after comparison plots starting from "Introduction" section.

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/matlab_root_locus.png">
</p>

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/matlab_niquist.png">
</p>

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/matlab_bode.png">
</p>

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/compensated_by_bode.png">
</p>

## Introduction

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

So, final transfer function of plant is H(s) = 991 / (1.537 * 10<sup>-6</sup>s<sup>2</sup> + 0.033s + 991)

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

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/root_locus_p2.png">
</p>

So, our final G<sub>c</sub>(s) = 20 * (s + 69480) / (s + 274190)

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/compensated_by_root_locus.png">
  <br>
  <i>Figure 6: Uncompensated and compensated by Gc system step responses</i>
</p>

We improved steady state error of step response, settling time, overshoot and rise time of the system.

## Niquist Analysis

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/niquist_p1.png">
</p>

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/niquist_p2.png">
</p>

#### Matlab Niquist Plot

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/niquist_matlab.png">
</p>

Both open loop is stable for values -∞<-1/K<0 and 1<-1/K<∞. Because in region between 0 and 1 there is one clockwise encirclement which mean one unstable pole. For the closed loop system, the system is unstable in region 0<-1/K<1. For rest regions system is stable.

## Bode Plot Analysis

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/bode_p1.png">
</p>

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/bode_p2.png">
</p>

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/bode_p3.png">
</p>

The final compensator designed in frequency domain is: G<sub>c</sub>(s) = 20 * (s + 49019.6) / (s + 225896.8)

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/compensated_by_bode.png">
  <br>
  <i>Figure 7: Uncompensated and compensated by Gc(s) system step responses</i>
</p>

We improved steady state error, settling time, overshoot and rise time of the system.

## Hardware Implementation

In parallel, we were developing hardware of feedback controller circuit with proportional controller and lead compensator. This is final circuit diagram of feedback control:

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/hardware_circuit.png">
  <br>
  <i>Figure 8: Circuit diagram of hardware feedback control system</i>
</p>

We have input signal V1 which is negatively summed with negative output to create -error signal which is goes to inverted gain, which plays role of proportional controller and sign normalizer. Error with gain goes to system with dominant zero and pole which is used as lead compensator followed by process. Potential difference across capacitor and resistor of process is an output voltage read by oscilloscope. Output of process goes to unity inverter to change the sign of it to make subtraction with input signal.

Designs of both root locus and bode plot were implemented, but we have some unexpected instabilities in root locus Gc(s) system. Now, our system is implemented by bode plot Gc.

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/hardware_circuit_real.png">
  <br>
  <i>Figure 9: Photo of our implemented feedback control system circuit</i>
</p>

Here you can see the final step response of the whole hardware system:

<p align="center">
  <img src="https://github.com/BatyaGG/Hardware-implementation-of-linear-controller/blob/master/figures/step_compensated_real.png">
  <br>
  <i>Figure 10: Practical step response of hardware feedback control system</i>
</p>

In figure 10 we can see that steady state error for step is approximately 9%, and overshoot is 10.2%. In comparison with MATLAB step response for bode plot compensator, steady state error is the same, hardware step response’s overshoot is better than calculated, however we lose appropriate time performance.

## Conclusion

First, the requirements were set. Using the root locus and bode analysis design two controllers were designed, theoretically satisfying the requirements for step response of the system. Comparing, MATLAB and practical implementation results, it can be concluded that their ratios are in acceptable ranges. Ratios of MATLAB and practical results: overshoot 3:1, settling time 2:5, steady state error almost 1:1, rise time about 100:1 in microseconds. Low performance of rise time could be caused by imperfect step signal from function generator, which could lead to delay.
During our project, different problems in hardware implementation were faced. It became clear that small uncertainties or slight changes can bring to very unexpected output. Also, it is noted that transfer functions cannot be easily implemented as it seems, proper frequencies for different elements and other various factors should be considered. 
