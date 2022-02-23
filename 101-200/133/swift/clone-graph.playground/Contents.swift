import Foundation

// 133. Clone Graph
// https://leetcode.com/problems/clone-graph/

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var visited: [Int:Node] = [:]
        return dfs(node, &visited)
    }
    
    private func dfs(_ node: Node?, _ visited: inout [Int:Node]) -> Node? {
        guard let node = node else { return nil }
        
        let new = Node(node.val)
        visited[node.val] = new
        
        for n in node.neighbors where n != nil {
            guard let nbr = visited[n!.val] ?? dfs(n, &visited) else { break }
            new.neighbors.append(nbr)
        }
        return new
    }
}

// MARK: - Node -

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
