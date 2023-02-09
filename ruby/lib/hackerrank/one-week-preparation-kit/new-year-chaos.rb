require 'json'
require 'stringio'

#
# Complete the 'minimumBribes' function below.
#
# The function accepts INTEGER_ARRAY q as parameter.
#

def minimumBribes(q)
  # Write your code here
  num_of_swaps = 0

  q.each_with_index do |num, index|
    # num = 2, index = 0
    expected = index + 1
    # num = 3, expected = 1 -> ok
    # num = 4, expected = 1 -> ng
    if num - 2 > expected
      puts('Too chaotic')
      return
    end

    index.downto(1) do |j|
      # rubocop:disable Style/GuardClause
      if q[j] < q[j - 1]
        q[j], q[j - 1] = q[j - 1], q[j]
        num_of_swaps += 1
      else
        break
      end
    end
  end

  puts(num_of_swaps)
end

# minimumBribes([2, 1, 5, 3, 4])
# minimumBribes('2 5 1 3 4'.split(' ').map(&:to_i))
# minimumBribes('5 1 2 3 7 8 6 4'.split(' ').map(&:to_i))
# minimumBribes('1 2 5 3 7 8 6 4'.split(' ').map(&:to_i))

t = gets.strip.to_i

t.times do |_t_itr|
  n = gets.strip.to_i

  q = gets.rstrip.split.map(&:to_i)

  minimumBribes q
end
