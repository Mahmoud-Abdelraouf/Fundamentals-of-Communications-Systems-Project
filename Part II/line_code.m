function line_coded = line_code (bits,voltage_high,voltage_low)
  line_coded = [];
  for i = 1:length(bits);
    if bits(i) == 1
      line_coded = [line_coded ones(1,200)*voltage_high];
    elseif bits(i) == 0
      line_coded = [line_coded ones(1,200)*voltage_low];
    endif
  endfor
end


