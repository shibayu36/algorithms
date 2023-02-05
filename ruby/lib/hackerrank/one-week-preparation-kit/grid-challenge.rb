require 'json'
require 'stringio'

#
# Complete the 'gridChallenge' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING_ARRAY grid as parameter.
#

def gridChallenge(grid)
  size = grid[0].length
  grid_to_chars = grid.map { |g| g.chars.sort }

  size.times do |i|
    column_chars = grid_to_chars.map { |g| g[i] }
    column_chars.each_cons(2) do |a, b|
      return 'NO' if a > b
    end
  end

  'YES'
end

# puts(gridChallenge(%w[ebacd fghij olmkn trpqs xywuv]))
# puts(gridChallenge(%w[abc lmp qrt]))
# puts(gridChallenge(%w[mpxz abcd wlmf]))
# puts(gridChallenge(%w[abc hjk mpq rtv]))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

t = gets.strip.to_i

t.times do |_t_itr|
  n = gets.strip.to_i

  grid = Array.new(n)

  n.times do |i|
    grid_item = gets.chomp

    grid[i] = grid_item
  end

  result = gridChallenge grid

  fptr.write result
  fptr.write "\n"
end

fptr.close
