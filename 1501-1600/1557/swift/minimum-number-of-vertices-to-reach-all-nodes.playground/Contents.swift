import Foundation

// 1557. Minimum Number of Vertices to Reach All Nodes
// https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/

class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var set = Set(0..<n)
        edges.forEach { set.remove($0[1]) }
        return set.sorted()
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // It's not possible to reach all the nodes from a single vertex.
    // From 0 we can reach [0,1,2,5]. From 3 we can reach [3,4,2,5]. So we output [0,3].
    func test0() {
        let value = solution.findSmallestSetOfVertices(6, [[0,1],[0,2],[2,5],[3,4],[4,2]])
        XCTAssertEqual(value, [0,3])
    }
    
    // Notice that vertices 0, 3 and 2 are not reachable from any other node, so we must include them.
    // Also any of these vertices can reach nodes 1 and 4.
    func test1() {
        let value = solution.findSmallestSetOfVertices(5, [[0,1],[2,1],[3,1],[1,4],[2,4]])
        XCTAssertEqual(value, [0,2,3])
    }
}

Tests.defaultTestSuite.run()
