def findZigZagSequence(arr)
  arr.sort!
  n = arr.length
  res = Array.new(n)

  arr[0..((n - 1) / 2) - 1].each_with_index do |v, i|
    res[i] = v
  end
  arr[((n - 1) / 2)..-1].each_with_index do |v, i|
    res[-1 - i] = v
  end

  res
end

# p(findZigZagSequence([2, 3, 5, 1, 4]))

test_case_num = gets.strip.to_i

test_case_num.times do
  _ = gets
  arr = gets.strip.split
  puts(findZigZagSequence(arr).join(' '))
end
