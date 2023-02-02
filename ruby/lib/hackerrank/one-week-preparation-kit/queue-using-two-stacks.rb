class QueueWithTwoStacks
  def initialize
    @stack1 = []
    @stack2 = []
  end

  def push(val)
    @stack1.push(val)
  end

  def pop
    return @stack2.pop unless @stack2.empty?

    until @stack1.empty?
      @stack2.push(@stack1.pop)
    end

    @stack2.pop
  end

  def first
    val = pop
    @stack2.push(val)
    val
  end
end

# queue = QueueWithTwoStacks.new
# queue.push(42)
# queue.pop
# queue.push(14)
# puts(queue.first)
# queue.push(28)
# queue.push(60)
# queue.pop
# puts(queue.first)

queue = QueueWithTwoStacks.new

command_num = gets.strip.to_i
command_num.times do
  command = gets.strip
  case command[0]
  when '1'
    queue.push(command.split(' ')[1].to_i)
  when '2'
    queue.pop
  when '3'
    puts(queue.first)
  end
end
