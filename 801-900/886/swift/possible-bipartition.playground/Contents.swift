import Foundation

// 886. Possible Bipartition
// https://leetcode.com/problems/possible-bipartition/

class Solution {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var graph = [[Int]](repeating: [], count: n + 1)
        var plt = [Int](repeating: 0, count: n + 1)
        
        for d in dislikes {
            graph[d[0]].append(d[1])
            graph[d[1]].append(d[0])
        }
        
        func dfs(_ node: Int, _ color: Int) -> Bool {
            plt[node] = color
            for i in graph[node] {
                if plt[i] == color { return false }
                if plt[i] == 0, dfs(i, -color) == false { return false }
            }
            return true
        }
        for x in (1...n) where plt[x] == 0 && dfs(x, 1) == false { return false }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // group1 [1,4] and group2 [2,3].
    func test0() {
        let value = solution.possibleBipartition(4, [[1,2],[1,3],[2,4]])
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.possibleBipartition(3, [[1,2],[1,3],[2,3]])
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.possibleBipartition(5, [[1,2],[2,3],[3,4],[4,5],[1,5]])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
