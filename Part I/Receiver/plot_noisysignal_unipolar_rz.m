## Copyright (C) 2023 User
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} plot_noisysignal_unipolar_rz (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: User <User@DESKTOP-B37PV3F>
## Created: 2023-05-20

function plot_noisy_signal_bipolar_rz(signal,samples_per_bit)
    % Create a time vector for the signal
    t = linspace(0, length(signal)/samples_per_bit, length(signal));
    figure
    % Plot the Unipolar NRZ signal with time
    plot(t, signal);
    ylim([-3, 3]);
    xlabel('Time (s)');
    ylabel('Amplitude (V)');
    title('Unipolar RZ Signal');
end
