import Foundation

// 1129. Shortest Path with Alternating Colors
// https://leetcode.com/problems/shortest-path-with-alternating-colors/

class Solution {
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        typealias Node = (node: Int, color: Int)
        var dist = [Int](repeating: .max, count: n)
        dist[0] = 0
        
        let graph = graphMaker(v: n, r: redEdges, b: blueEdges)
        
        var queue = [Node(0,1), Node(0,-1)]
        
        var len = 0, visit: [Node] = []
        
        while !queue.isEmpty {
            len += 1
            for _ in 0..<queue.count {
                /// First color node
                let first = queue.removeFirst()
                let node = first.node, _col  = -(first.color)
                for j in 1..<n where graph[node][j] == _col || graph[node][j] == 0 {
                    /// Next color node
                    let ncn = Node(j, _col)
                    if !visit.contains(where: { $0 == ncn }) {
                        queue.append(ncn)
                        dist[j] = min(dist[j], len)
                        visit.append(ncn)
                    }
                }
            }
        }
        for i in 1..<n where dist[i] == .max {
            dist[i] = -1
        }
        return dist
    }
    
    private func graphMaker(v: Int, r: [[Int]], b: [[Int]]) ->  [[Int]] {
        var graph = [[Int]](repeating: [Int](repeating: .min, count: v), count: v)
        for e in r {
            graph[e[0]][e[1]] = 1
        }
        for e in b {
            let from = e[0], to = e[1]
            graph[from][to] = (graph[from][to] == 1) ? 0 : -1
        }
        return graph
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.018 (0.020) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.shortestAlternatingPaths(3, [[0,1],[1,2]], [])
        XCTAssertEqual(value, [0,1,-1])
    }
    
    func test1() {
        let value = solution.shortestAlternatingPaths(3, [[0,1]], [[2,1]])
        XCTAssertEqual(value, [0,1,-1])
    }
}

Tests.defaultTestSuite.run()
