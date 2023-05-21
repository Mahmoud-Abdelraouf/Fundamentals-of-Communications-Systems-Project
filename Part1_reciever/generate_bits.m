% GENERATE_BITS Generates a sequence of random binary values.
%
%   bits = generate_bits(num_bits)
%
%   Arguments:
%   - num_bits: The number of bits to generate.
%
%   Returns:
%   - bits: A row vector of binary values (0 or 1) representing the generated
%           bit sequence.
%
%   The function generates a sequence of random binary values using the `randi`
%   function. The `randi` function generates random integers between 0 and 1,
%   which are mapped to binary values. The output is a row vector of binary
%   values of length `num_bits`.
%
%   Example usage:
%   >> num_bits = 10;
%   >> bits = generate_bits(num_bits);
%   >> disp(bits);
%
function bits = generate_bits (num_bits)
  bits = randi([0, 1], 1, num_bits);
end
















