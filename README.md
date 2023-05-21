## Line Coding and BPSK Transmitter and Receiver Project

### Overview
This project involves the implementation of a line coding system and binary phase shift-keying (BPSK) transmitter and receiver. The aim of the project is to design and analyze different line coding techniques and evaluate their performance in the presence of noise. The project is divided into two parts:

- Part I: Implementation of a line coding system and evaluation of its performance under different line coding techniques and noise levels.
- Part II: Implementation of a BPSK transmitter and receiver and evaluation of its performance.

### Part I: Line Coding System
#### Transmitter
1. Generate stream of random bits (10,000 bit) (This bit stream should be selected to be random, which means that the type of each bit is randomly selected by the program code to be either ‘1’ or ‘0’).
2. Line code the stream of bits (pulse shape) according to Uni-polar non return to zero (Supply voltages are: +1.2 V and -1.2V).
3. Plot the corresponding Eye diagram.
4. Plot the spectral domains of the pulses (square of the Fourier transform).

#### Receiver
5. Design a receiver which consists of a decision device. (The decision device has two inputs: received waveform).
6. Compare the output of the decision level with the generated stream of bits in the transmitter. The comparison is performed by comparing the value of each received bit with thecorresponding transmitted bit (step 1) and count number of errors. Then calculate bit error rate (BER) = number of error bits/ Total number of bits.
7. Repeat the previous steps for different line coding (Polar non return to zero, Uni-polar return to zero, Bipolar return to zero and Manchester coding).
8. Add noise to the received signal (Hint: use n = sigma * randn(1,length(t) ),where t is time vector and sigma is the noise RMS value).
9. Sweep on the value of sigma (10 values ranges from 0 to the maximum supply voltage) and calculate the corresponding BER for each value of sigma.
10. Repeat the previous steps for different line coding and plot BER versus sigma for the different line coding in the same figure, where y-axis is in the log scale (Hint: use semilogy).
11. (Bonus) For the case of Bipolar return to zero, design an error detection circuit. Count the number of detected errors in case of different number of sigma (Use the output of step 8).

### Part II: BPSK Transmitter and Receiver
#### Transmitter
1. Generate stream of random bits (100 bit) (This bit stream should be selected to be random, which means that the type of each bit is randomly selected by the program code to be either ‘1’ or ‘0’).
2. Line code the stream of bits (pulse shape) according to Polarnon-return to zero (Maximum voltage +1, Minimum voltage -1).
3. Plot the spectral domains.
4. Plot the time domain of the modulated BPSK signal (fc = 1 GHz).
5. Plot the spectrum of the modulated BPSK signal.

#### Receiver
6. Design a receiver which consists of modulator, integrator (simply LPF) and decision device.
7. Compare the output of decision level with the generated stream of bits in the transmitter. The comparison is performed by comparing the value of each received bit with the corresponding transmitted bit (step 1) and count number of errors. Then calculate bit error rate (BER) = number of error bits/ Total number of bits.

### Required Software and Tools
- MATLAB
- Signal Processing Toolbox

### How to Run the Code
1. Clone or download the project repository.
2. Open MATLAB and navigate to the project directory.
3. Run the MATLAB scripts in the following order:
   - `part1_transmitter.m`
   - `part1_receiver.m`
   - `part2_transmitter.m`
   - `part2_receiver.m`
4. Follow the instructions provided within each script to run the code and generate the required plots.

Note: The code is designed to be run on MATLAB R2021a or later with the Signal Processing Toolbox installed.

### Acknowledgements
This project was created as part of a coursework assignment in a digital communication systems course. Theinstructions for the project were provided by the course instructor. The code implementation and README file were prepared by myself as a student. The Signal Processing Toolbox in MATLAB was used extensively in the code implementation.
