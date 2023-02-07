# * 最低手数を戻すだけ
# * 経路も復元

class SolveMaze
  VECTOR = [[0, 1], [0, -1], [1, 0], [-1, 0]]

  def initialize(maze_struct)
    @maze_struct = maze_struct
    @maze_width = @maze_struct.first.size
    @maze_height = @maze_struct.size

    @maze_dist = Array.new(@maze_height) { Array.new(@maze_width, nil) }
    @search_queue = []
    @maze_struct.each_with_index do |row, y|
      row.each_with_index do |val, x|
        if val == 'S'
          @search_queue.push([x, y])
          @maze_dist[y][x] = 0
        end
      end
    end
  end

  def calc_by_bfs
    until @search_queue.empty?
      cur_x, cur_y = @search_queue.shift
      return @maze_dist[cur_y][cur_x] if @maze_struct[cur_y][cur_x] == 'G'

      VECTOR.each do |dx, dy|
        next_x = cur_x + dx
        next_y = cur_y + dy

        # outbound
        next if next_x < 0 || next_x >= @maze_width
        next if next_y < 0 || next_y >= @maze_height
        next if @maze_struct[next_y][next_x] == '#' # wall
        next if @maze_dist[next_y][next_x] # already visited

        @maze_dist[next_y][next_x] = @maze_dist[cur_y][cur_x] + 1
        @search_queue.push([next_x, next_y])
      end
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
puts(SolveMaze.new(maze_struct).calc_by_bfs)
