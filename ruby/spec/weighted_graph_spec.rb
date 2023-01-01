require 'weighted_graph'

describe WeightedGraph do
  it 'constructs undirected graph' do
    graph = WeightedGraph.new
    graph.add_edge(1, 2, 2)
    graph.add_edge(1, 3, 1)
    graph.add_edge(2, 4, 5)
    graph.add_edge(3, 5, 4)
    graph.add_edge(4, 5, 1)
    graph.add_edge(4, 6, 2)
    expect(graph.edges).to eq(
      [
        { from: 1, to: 2, weight: 2 },
        { from: 1, to: 3, weight: 1 },
        { from: 2, to: 1, weight: 2 },
        { from: 2, to: 4, weight: 5 },
        { from: 3, to: 1, weight: 1 },
        { from: 3, to: 5, weight: 4 },
        { from: 4, to: 2, weight: 5 },
        { from: 4, to: 5, weight: 1 },
        { from: 4, to: 6, weight: 2 },
        { from: 5, to: 3, weight: 4 },
        { from: 5, to: 4, weight: 1 },
        { from: 6, to: 4, weight: 2 }
      ]
    )
  end

  it 'constructs directed graph' do
    graph = WeightedGraph.new
    graph.add_directed_edge(1, 2, 2)
    graph.add_directed_edge(1, 3, 1)
    graph.add_directed_edge(2, 4, 5)
    graph.add_directed_edge(3, 5, 4)
    graph.add_directed_edge(4, 5, 1)
    graph.add_directed_edge(4, 6, 2)
    expect(graph.edges).to eq(
      [
        { from: 1, to: 2, weight: 2 },
        { from: 1, to: 3, weight: 1 },
        { from: 2, to: 4, weight: 5 },
        { from: 3, to: 5, weight: 4 },
        { from: 4, to: 5, weight: 1 },
        { from: 4, to: 6, weight: 2 }
      ]
    )
  end
end
