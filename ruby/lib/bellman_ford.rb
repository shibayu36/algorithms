class BellmanFord
  def initialize(graph, from, to)
    @graph = graph
    @from = from
    @to = to
  end

  def shortest_cost
    @cost = Hash.new(Float::INFINITY)
    @cost[@from] = 0

    (0..@graph.points.length - 1).each do |i|
      is_changed = false

      @graph.edges.each do |edge|
        candidate_cost = @cost[edge[:from]] + edge[:weight]
        if candidate_cost < @cost[edge[:to]]
          @cost[edge[:to]] = candidate_cost
          is_changed = true

          # negative loop detection.
          # This algorithm must finish within n - 1 iterations.
          # If the N-th iteration change cost, there must be a negative loop.
          if i == @graph.points.length - 1
            raise 'negative loop detected'
          end
        end
      end

      break unless is_changed
    end

    @cost[@to]
  end

  # TODO: shortest_path
end
