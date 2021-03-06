import Foundation

// 797. All Paths From Source to Target
// https://leetcode.com/problems/all-paths-from-source-to-target/

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        guard !graph.isEmpty else { return [] }
        
        let tail = graph.count - 1
        
        var stack: [Int] = []
        var result: [[Int]] = []
        
        func dfs(n: Int) {
            guard n != tail else {
                result.append(stack + [tail])
                return
            }
            for i in graph[n] {
                stack.append(n)
                dfs(n: i)
                stack.removeLast()
            }
        }
        dfs(n: 0)
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.
    func test0() {
        let value = solution.allPathsSourceTarget([[1,2],[3],[3],[]])
        XCTAssertEqual(value, [[0,1,3],[0,2,3]])
    }
    
    func test1() {
        let value = solution.allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]])
        XCTAssertEqual(value, [[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]])
    }
}

Tests.defaultTestSuite.run()
