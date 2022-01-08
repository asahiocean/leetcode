import Foundation

// 62. Unique Paths
// https://leetcode.com/problems/unique-paths/

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0 else { return 0 }
        var dp = [Int](repeating: 1, count: n)
        for _ in 1..<m {
            for c in 1..<n {
                dp[c] += dp[c - 1]
            }
        }
        return dp.last ?? 0
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.uniquePaths(3, 7)
        XCTAssertEqual(value, 28)
    }
    
    /// From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
    /// 1. Right -> Down -> Down
    /// 2. Down -> Down -> Right
    /// 3. Down -> Right -> Down
    func test1() {
        let value = solution.uniquePaths(3, 2)
        XCTAssertEqual(value, 3)
    }
    
    func test2() {
        let value = solution.uniquePaths(7, 3)
        XCTAssertEqual(value, 28)
    }
    
    func test3() {
        let value = solution.uniquePaths(3, 3)
        XCTAssertEqual(value, 6)
    }
}

Tests.defaultTestSuite.run()
