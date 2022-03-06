import Foundation

// 847. Shortest Path Visiting All Nodes
// https://leetcode.com/problems/shortest-path-visiting-all-nodes/

class Solution {
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        struct State: Hashable {
            let node: Int, vzit: UInt16
        }
        
        let len = graph.count, one: UInt16 = 1, total = one << len - 1
        
        var queue: [State] = [], setVzit: Set<State> = []
        
        for n in 0..<len {
            let state = State(node: n, vzit: one << n)
            queue.append(state)
            setVzit.insert(state)
        }
        
        var level = 0
        
        while !queue.isEmpty {
            level += 1
            var nextLvl: [State] = []
            for state in queue {
                for n in graph[state.node] {
                    let visit: UInt16 = state.vzit | (one << n)
                    guard visit != total else { return level }
                    let next = State(node: n, vzit: visit)
                    guard !(setVzit.contains(next)) else { continue }
                    setVzit.insert(next)
                    nextLvl.append(next)
                }
            }
            queue = nextLvl
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
