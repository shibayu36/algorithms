require 'weighted_graph'
require 'bellman_ford'

describe WeightedGraph do
  it 'calculates shortest cost' do
    graph = WeightedGraph.new
    graph.add_edge('A', 'B', 9)
    graph.add_edge('A', 'C', 2)
    graph.add_edge('B', 'C', 6)
    graph.add_edge('B', 'D', 3)
    graph.add_edge('B', 'E', 1)
    graph.add_edge('C', 'D', 2)
    graph.add_edge('C', 'F', 9)
    graph.add_edge('D', 'E', 5)
    graph.add_edge('D', 'F', 6)
    graph.add_edge('E', 'F', 3)
    graph.add_edge('E', 'G', 7)
    graph.add_edge('F', 'G', 4)
    expect(BellmanFord.new(graph).shortest_cost('A', 'G')).to eq(14)
  end
end
