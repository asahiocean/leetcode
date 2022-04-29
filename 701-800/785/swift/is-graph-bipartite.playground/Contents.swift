import Foundation

// 785. Is Graph Bipartite?
// https://leetcode.com/problems/is-graph-bipartite/

class Solution {
    func isBipartite(_ g: [[Int]]) -> Bool {
        guard !g.isEmpty else { return false }
        var clr = [Int](repeating: -1, count: g.count)
        for i in 0..<g.count where clr[i] == -1 && !dfs(0, i) { return false }
        func dfs(_ c: Int, _ i: Int) -> Bool {
            guard clr[i] == -1 else { return clr[i] == c }
            clr[i] = c
            return g[i].first(where: { !dfs(1 - c, $0) }) == nil
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
