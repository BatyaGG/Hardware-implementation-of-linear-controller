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

