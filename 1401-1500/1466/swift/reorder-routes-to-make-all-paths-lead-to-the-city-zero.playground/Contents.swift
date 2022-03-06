import Foundation

// 1466. Reorder Routes to Make All Paths Lead to the City Zero
// https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/

class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var visited: Set<Int> = [], graph: [Int:[Int]] = [:]
        
        for c in connections {
            let from = c[0], next = c[1]
            graph[from, default: .init()].append(next)
            graph[next, default: .init()].append(-from)
        }
        func dfs(_ start: Int) -> Int {
            var val = 0
            guard !visited.contains(start) else { return val }
            visited.insert(start)
            for next in graph[start, default: .init()] where !visited.contains(next) {
                val += dfs(abs(next))
                if next > 0 { val += 1 }
            }
            return val
        }
        return dfs(0)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Change the direction of edges show in red such that each node can reach the node 0 (capital).
    func test0() {
        let value = solution.minReorder(6, [[0,1],[1,3],[2,3],[4,0],[4,5]])
        XCTAssertEqual(value, 3)
    }
    
    // Change the direction of edges show in red such that each node can reach the node 0 (capital).
    func test1() {
        let value = solution.minReorder(5, [[1,0],[1,2],[3,2],[3,4]])
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.minReorder(3, [[1,0],[2,0]])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
