require 'json'
require 'stringio'

#
# Complete the 'isBalanced' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

MATCH_DATA = {
  '{' => '}',
  '[' => ']',
  '(' => ')'
}
def isBalanced(s)
  stack = []

  s.each_char do |c|
    case c
    when '{', '[', '('
      stack.push(c)
    when '}', ']', ')'
      char_to_compare = stack.pop
      return 'NO' unless MATCH_DATA[char_to_compare] == c
    end
  end

  stack.empty? ? 'YES' : 'NO'
end

# puts(isBalanced('{[()]}'))
# puts(isBalanced('{[(])}'))
# puts(isBalanced('{{[[(())]]}}'))
# puts(isBalanced('('))
# puts(isBalanced('{(([])[])[]}'))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

t = gets.strip.to_i

t.times do |_t_itr|
  s = gets.chomp

  result = isBalanced s

  fptr.write result
  fptr.write "\n"
end

fptr.close
