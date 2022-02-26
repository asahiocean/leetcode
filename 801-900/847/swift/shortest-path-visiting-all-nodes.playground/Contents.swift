import Foundation

// 847. Shortest Path Visiting All Nodes
// https://leetcode.com/problems/shortest-path-visiting-all-nodes/

class Solution {
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        struct State: Hashable {
            let node: Int, visited: UInt16
        }
        let one: UInt16 = 1
        let len = graph.count
        
        let total: UInt16 = one << len - 1
        
        var queue: [State] = []
        var visited: Set<State> = []
        
        for node in 0..<len {
            let state = State(node: node, visited: one << node)
            queue.append(state)
            visited.insert(state)
        }
        
        var level = 0
        while !queue.isEmpty {
            level += 1
            var nextLevel: [State] = []
            for state in queue {
                for node in graph[state.node] {
                    let visit: UInt16 = state.visited | (one << node)
                    guard visit != total else { return level }
                    let next = State(node: node, visited: visit)
                    guard !(visited.contains(next)) else { continue }
                    visited.insert(next)
                    nextLevel.append(next)
                }
            }
            queue = nextLevel
        }
        return 0
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.038 (0.040) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // One possible path is [1,0,2,0,3]
    func test0() {
        let value = solution.shortestPathLength([[1,2,3],[0],[0],[0]])
        XCTAssertEqual(value, 4)
    }
    
    // One possible path is [0,1,4,2,3]
    func test1() {
        let value = solution.shortestPathLength([[1],[0,2,4],[1,3,4],[2],[1,2]])
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()
