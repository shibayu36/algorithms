require 'undirected_graph'

describe UndirectedGraph do
  it 'constructs undirected graph' do
    graph = UndirectedGraph.new
    graph.add_edge(1, 2)
    graph.add_edge(1, 3)
    graph.add_edge(2, 4)
    graph.add_edge(3, 5)
    graph.add_edge(4, 5)
    graph.add_edge(4, 6)
    expect(graph.to_h).to eq(
      {
        1 => [2, 3],
        2 => [1, 4],
        3 => [1, 5],
        4 => [2, 5, 6],
        5 => [3, 4],
        6 => [4]
      }
    )
  end

  it 'can use string for points' do
    graph = UndirectedGraph.new
    graph.add_edge('a', 'b')
    graph.add_edge('a', 'c')
    expect(graph.to_h).to eq(
      {
        'a' => %w[b c],
        'b' => ['a'],
        'c' => ['a']
      }
    )
  end
end
