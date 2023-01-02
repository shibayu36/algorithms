class BellmanFord
  def initialize(graph)
    @graph = graph
  end

  def shortest_cost(from, to)
    @cost = Hash.new(Float::INFINITY)
    @cost[from] = 0

    (0..@graph.points.length - 1).each do |_i|
      is_changed = false

      @graph.edges.each do |edge|
        candidate_cost = @cost[edge[:from]] + edge[:weight]
        if candidate_cost < @cost[edge[:to]]
          @cost[edge[:to]] = candidate_cost
          is_changed = true
          # TODO: negative loop detection
        end
      end

      break unless is_changed
    end

    @cost[to]
  end
end
