class SolveMaze
  VECTOR = [[0, 1], [0, -1], [1, 0], [-1, 0]]

  def initialize(maze_struct)
    @maze_struct = maze_struct
    @maze_width = @maze_struct.first.size
    @maze_height = @maze_struct.size

    # The distance between start to @maze_dist[x][y]
    @maze_dist = Array.new(@maze_height) { Array.new(@maze_width, nil) }
    # The previous position of @maze_dist[x][y]
    @maze_prev_links = Array.new(@maze_height) { Array.new(@maze_width, nil) }

    @search_queue = []
    @maze_struct.each_with_index do |row, x|
      row.each_with_index do |val, y|
        if val == 'S'
          @maze_start = [x, y]
          @search_queue.push([x, y])
          @maze_dist[x][y] = 0
        elsif val == 'G'
          @maze_goal = [x, y]
        end
      end
    end
  end

  def calc_by_bfs
    until @search_queue.empty?
      cur_x, cur_y = @search_queue.shift
      return @maze_dist[cur_x][cur_y] if @maze_struct[cur_x][cur_y] == 'G'

      VECTOR.each do |dx, dy|
        next_x = cur_x + dx
        next_y = cur_y + dy

        # outbound
        next if next_x < 0 || next_x >= @maze_width
        next if next_y < 0 || next_y >= @maze_height
        next if @maze_struct[next_x][next_y] == '#' # wall
        next if @maze_dist[next_x][next_y] # already visited

        @maze_dist[next_x][next_y] = @maze_dist[cur_x][cur_y] + 1
        @maze_prev_links[next_x][next_y] = [cur_x, cur_y]
        @search_queue.push([next_x, next_y])
      end
    end
  end

  def get_route
    route = []
    cur_x, cur_y = @maze_goal
    until cur_x == @maze_start[0] && cur_y == @maze_start[1]
      route.unshift([cur_x, cur_y])
      cur_x, cur_y = @maze_prev_links[cur_x][cur_y]
    end
    route.unshift(@maze_start)
    route
  end

  def print_route
    route = get_route
    maze_solved_struct = Marshal.load(Marshal.dump(@maze_struct))
    route[1..-2].each do |x, y|
      maze_solved_struct[x][y] = '*'
    end
    maze_solved_struct.each do |row|
      puts(row.join(''))
    end
  end
end

maze_str = <<~STR
  .#....#G
  .#.#....
  ...#.##.
  #.##...#
  ...###.#
  .#.....#
  ...#.#..
  S.......
STR
maze_struct = maze_str.split("\n").map { |line| line.split('') }
maze_solver = SolveMaze.new(maze_struct)
puts(maze_solver.calc_by_bfs)
maze_solver.print_route

maze_str2 = <<~STR
  S..#......
  .#...##.#.
  .##.#...#.
  ...#..##.#
  ##..#.#...
  ...#.#..#G
  .#....#..#
  ..#.#..#..
  .#.#.#..#.
  ......#...
STR
maze_struct2 = maze_str2.split("\n").map { |line| line.split('') }
maze_solver2 = SolveMaze.new(maze_struct2)
puts(maze_solver2.calc_by_bfs)
maze_solver2.print_route
