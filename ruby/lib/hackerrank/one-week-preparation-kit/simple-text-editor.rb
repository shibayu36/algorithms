# Enter your code here. Read input from STDIN. Print output to STDOUT

class SimpleTextEditor
  attr_reader :content

  def initialize(content = '')
    @content = content
    @undo_stack = []
  end

  def operate(op)
    command, param = op.split(' ')
    case command
    when '1'
      append(param)
    when '2'
      delete(param.to_i)
    when '3'
      print(param.to_i)
    when '4'
      undo
    end
  end

  def append(s)
    @undo_stack.push(@content)
    @content += s
  end

  def delete(k)
    @undo_stack.push(@content)
    @content = @content[0..-k - 1]
  end

  def print(k)
    puts(@content[k - 1])
  end

  def undo
    @content = @undo_stack.pop
  end
end

editor = SimpleTextEditor.new
# puts(editor.print(2))
# puts(editor.content)
# editor.append('hoge')
# puts(editor.content)
# editor.append('fuga')
# puts(editor.content)
# editor.delete(3)
# puts(editor.content)
# editor.undo
# puts(editor.content)
# editor.undo
# puts(editor.content)

q = gets.chomp.to_i
q.times do
  op = gets.chomp
  editor.operate(op)
end
