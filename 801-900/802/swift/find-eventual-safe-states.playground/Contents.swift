import Foundation

// 802. Find Eventual Safe States
// https://leetcode.com/problems/find-eventual-safe-states/

class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        guard !graph.isEmpty else { return [] }
        
        var result: [Int] = [], queue: [Int] = []
        
        let len = graph.count
        var out = [Int](repeating: 0, count: len)
        var mat = [[Int]](repeating: [], count: len)
        
        for i in 0..<len {
            let count = graph[i].count
            out[i] = count
            if out[i] == 0 { queue.append(i) }
            for j in 0..<count {
                mat[graph[i][j]].append(i)
            }
        }
        while !queue.isEmpty {
            let first = queue.removeFirst()
            result.append(first)
            for j in 0..<mat[first].count {
                let val = mat[first][j]
                out[val] -= 1
                if out[val] == 0 { queue.append(val) }
            }
        }
        return result.sorted()
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The given graph is shown above.
    // Nodes 5 and 6 are terminal nodes as there are no outgoing edges from either of them.
    // Every path starting at nodes 2, 4, 5, and 6 all lead to either node 5 or 6.
    func test0() {
        let value = solution.eventualSafeNodes([[1,2],[2,3],[5],[0],[5],[],[]])
        XCTAssertEqual(value, [2,4,5,6])
    }
    
    // Only node 4 is a terminal node, and every path starting at node 4 leads to node 4.
    func test1() {
        let value = solution.eventualSafeNodes([[1,2,3,4],[1,2],[3,4],[0,4],[]])
        XCTAssertEqual(value, [4])
    }
}

Tests.defaultTestSuite.run()
