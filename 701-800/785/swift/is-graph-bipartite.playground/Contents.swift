import Foundation

// 785. Is Graph Bipartite?
// https://leetcode.com/problems/is-graph-bipartite/

class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        guard !graph.isEmpty else { return false }
        let len = graph.count
        var colors = [Int](repeating: -1, count: len)
        
        func dfs(_ graph: [[Int]], _ color: Int, _ i: Int) -> Bool {
            if colors[i] != -1 { return colors[i] == color }
            colors[i] = color
            for n in graph[i] where !dfs(graph, 1 - color, n) {
                return false
            }
            return true
        }
        for i in 0..<len where colors[i] == -1 && !dfs(graph, 0, i) {
            return false
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There is no way to partition the nodes into two independent sets
    // such that every edge connects a node in one and a node in the other.
    func test0() {
        let value = solution.isBipartite([[1,2,3],[0,2],[0,1,3],[0,2]])
        XCTAssertEqual(value, false)
    }
    
    // We can partition the nodes into two sets: {0, 2} and {1, 3}.
    func test1() {
        let value = solution.isBipartite([[1,3],[0,2],[1,3],[0,2]])
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()
