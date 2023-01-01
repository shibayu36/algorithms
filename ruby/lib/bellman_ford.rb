class BellmanFord
  def initialize(graph)
    @graph = graph
  end

  def shortest_cost(from, to)
    @cost = Hash.new(Float::INFINITY)
    @cost[from] = 0

    (0..@graph.points.length - 1).each do |_i|
      @graph.edges.each do |edge|
        candidate_cost = @cost[edge[:from]] + edge[:weight]
        if candidate_cost < @cost[edge[:to]]
          @cost[edge[:to]] = candidate_cost
          # TODO: negative loop detection
        end
      end
      # TODO: no longer need to iterate if no change
    end

    @cost[to]
  end
end
