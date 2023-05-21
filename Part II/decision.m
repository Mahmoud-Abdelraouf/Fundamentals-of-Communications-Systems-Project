## Copyright (C) 2023 AHMED BAKR
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
## @deftypefn {} {@var{retval} =} decision (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: AHMED BAKR <AHMED BAKR@DESKTOP-MBA9JIT>
## Created: 2023-05-19

function reconstructed = decision (bits)
  reconstructed = [];

  for index=1:length(bits)
    if bits(index) > 0
      reconstructed(index) = 1;
    elseif bits(index)<=0
      reconstructed(index)=0;
    endif
  endfor

endfunction
