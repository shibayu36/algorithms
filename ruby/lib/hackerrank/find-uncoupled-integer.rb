def find_uncoupled_integer(arr)
  arr.reduce(:^)
end

inputs = $stdin.gets.split(', ').map(&:to_i)
puts(find_uncoupled_integer(inputs))
