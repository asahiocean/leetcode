import Foundation

// 1615. Maximal Network Rank
// https://leetcode.com/problems/maximal-network-rank/

class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var graph: [Int:Set<Int>] = [:]
        var rank = 0
        for r in roads {
            graph[r[0], default: []].insert(r[1])
            graph[r[1], default: []].insert(r[0])
        }
        
        for a in 0...n {
            for b in 0...n where b != a {
                let setA = graph[a] ?? []
                let setB = graph[b] ?? []
                var sum = setA.count + setB.count
                if setA.contains(b) && setB.contains(a) {
                    sum -= 1
                }
                rank = max(rank, sum)
            }
        }
        return rank
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.025 (0.027) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The network rank of cities 0 and 1 is 4 as there are 4 roads that are
    // connected to either 0 or 1. The road between 0 and 1 is only counted once.
    func test0() {
        let value = solution.maximalNetworkRank(4, [[0,1],[0,3],[1,2],[1,3]])
        XCTAssertEqual(value, 4)
    }
    
    // There are 5 roads that are connected to cities 1 or 2.
    func test1() {
        let value = solution.maximalNetworkRank(5, [[0,1],[0,3],[1,2],[1,3],[2,3],[2,4]])
        XCTAssertEqual(value, 5)
    }
    
    // The network rank of 2 and 5 is 5. Notice that all the cities do not have to be connected.
    func test2() {
        let value = solution.maximalNetworkRank(8, [[0,1],[1,2],[2,3],[2,4],[5,6],[5,7]])
        XCTAssertEqual(value, 5)
    }
}

Tests.defaultTestSuite.run()
