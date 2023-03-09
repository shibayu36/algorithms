class SimpleTextEditor
  def initialize
    @string = ''
    @undo_stack = []
  end

  def operate(op)
    query, arg = op.split

    case query
    when '1'
      append(arg)
    when '2'
      delete(arg.to_i)
    when '3'
      print(arg.to_i)
    when '4'
      undo
    end
  end

  def append(w)
    @undo_stack.push(@string.dup)
    @string += w
  end

  def delete(k)
    @undo_stack.push(@string.dup)
    @string = @string[0..-k - 1]
  end

  def print(k)
    puts(@string[k - 1])
  end

  def undo
    @string = @undo_stack.pop
  end
end

editor = SimpleTextEditor.new

q = gets.chomp.to_i
q.times do
  op = gets.chomp
  editor.operate(op)
end
