#
# Complete the 'palindromeIndex' function below.
#
# The function is expected to return an INTEGER.
# The function accepts STRING s as parameter.
#

def palindromeIndex(s)
  start = 0
  finish = s.size - 1

  while start < finish
    if s[start] == s[finish]
      start += 1
      finish -= 1
      next
    else
      if palindrome?(s[start + 1..finish])
        return start
      elsif palindrome?(s[start..finish - 1])
        return finish
      else
        return -1
      end
    end
  end

  -1
end

def palindrome?(s)
  s == s.reverse
end

# puts(palindromeIndex('aaab'))
# puts(palindromeIndex('baa'))
# puts(palindromeIndex('aaa'))
# puts(palindromeIndex('abc'))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

q = gets.strip.to_i

q.times do |_q_itr|
  s = gets.chomp

  result = palindromeIndex s

  fptr.write result
  fptr.write "\n"
end

fptr.close
