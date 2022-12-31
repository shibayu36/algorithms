def is_balanced?(string)
  chars = string.split('')
  stack = []
  relation = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }

  chars.each do |char|
    case char
    when '(', '[', '{'
      stack.push(char)
    when ')', ']', '}'
      opener = stack.pop
      return false if relation[opener] != char
    end
  end

  stack.empty?
end

puts(is_balanced?($stdin.gets) ? 'True' : 'False')
