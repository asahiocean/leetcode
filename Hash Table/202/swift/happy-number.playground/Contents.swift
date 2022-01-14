import Foundation

// 202. Happy Number
// https://leetcode.com/problems/happy-number/

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var visited: Set<Int> = [], val = n
        while val != 1 && !visited.contains(val) {
            visited.insert(val)
            var sum = 0
            while val > 0 {
                sum += Int(pow(Double((val % 10)), 2))
                val = val / 10
            }
            val = sum
        }
        return val == 1
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 1^2 + 9^2 = 82
    // 8^2 + 2^2 = 68
    // 6^2 + 8^2 = 100
    // 1^2 + 0^2 + 0^2 = 1
    func test0() {
        let value = solution.isHappy(19)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isHappy(2)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
