import Foundation

// 1306. Jump Game III
// https://leetcode.com/problems/jump-game-iii/

class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var visited = [Bool](repeating: false, count: arr.count)
        visited[start] = true
        return dfs(arr, start, &visited)
    }
    
    private func dfs(_ arr: [Int], _ p: Int, _ arrVzit: inout [Bool]) -> Bool {
        guard arr[p] != 0 else { return true }
        for i in [p + arr[p], p - arr[p]] where i >= 0 && i < arr.count && !arrVzit[i] {
            arrVzit[i] = true
            if dfs(arr, i, &arrVzit) { return true }
            arrVzit[i] = false
        }
        return false
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // All possible ways to reach at index 3 with value 0 are:
    // index 5 -> index 4 -> index 1 -> index 3
    // index 5 -> index 6 -> index 4 -> index 1 -> index 3
    func test0() {
        let value = solution.canReach([4,2,3,0,3,1,2], 5)
        XCTAssertEqual(value, true)
    }
    
    // One possible way to reach at index 3 with value 0 is:
    // index 0 -> index 4 -> index 1 -> index 3
    func test1() {
        let value = solution.canReach([4,2,3,0,3,1,2], 0)
        XCTAssertEqual(value, true)
    }
    
    // There is no way to reach at index 1 with value 0.
    func test2() {
        let value = solution.canReach([3,0,2,1,2], 2)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
