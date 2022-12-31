class UndirectedGraph
  def initialize
    @graph = Hash.new { |h, k| h[k] = [] }
  end

  def add_edge(from, to)
    @graph[from].push(to)
    @graph[to].push(from)
  end

  def to_h
    @graph
  end
end
