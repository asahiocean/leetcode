import Foundation

// 77. Combinations
// https://leetcode.com/problems/combinations/

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard k <= n else { return [] }
        guard k != 1 else { return (1...n).map{[$0]} }
        guard k != n else { return [[Int](1...n)] }
        
        var current: [Int] = []
        var visited: Set<Int> = []
        var result: [[Int]] = []
        
        backtracking(&result, &current, &visited, 0, n, k)
        return result
    }
    private func backtracking(_ result: inout [[Int]], _ current: inout [Int], _ visited: inout Set<Int>,  _ last: Int, _ n: Int, _ k: Int) {
        guard current.count != k else {
            result.append(current)
            return
        }
        for num in max(1, last)...n where !visited.contains(num) {
            current.append(num)
            visited.insert(num)
            backtracking(&result, &current, &visited, num, n, k)
            current.removeLast()
            visited.remove(num)
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.025 (0.027) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.combine(4, 2)
        XCTAssertEqual(value, [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]])
    }
    
    func test1() {
        let value = solution.combine(1, 1)
        XCTAssertEqual(value, [[1]])
    }
}

Tests.defaultTestSuite.run()
