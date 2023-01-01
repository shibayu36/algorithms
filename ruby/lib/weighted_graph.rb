class WeightedGraph
  def initialize
    @graph = Hash.new { |h, k| h[k] = [] }
  end

  def add_edge(from, to, weight)
    @graph[from].push(Edge.new(from, to, weight))
    @graph[to].push(Edge.new(to, from, weight))
  end

  def add_directed_edge(from, to, weight)
    @graph[from].push(Edge.new(from, to, weight))
  end

  def points
    @graph.keys
  end

  def edges
    @graph.values.flat_map do |edges|
      edges.map do |edge|
        { from: edge.from, to: edge.to, weight: edge.weight }
      end
    end
  end

  class Edge
    attr_reader :from, :to, :weight

    def initialize(from, to, weight)
      @from = from
      @to = to
      @weight = weight
    end
  end
end
