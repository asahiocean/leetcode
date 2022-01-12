import Foundation

// 231. Power of Two
// https://leetcode.com/problems/power-of-two/

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n <= 0 ? false : (n&(n - 1)) == 0
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 2^0 = 1
    func test0() {
        let value = solution.isPowerOfTwo(1)
        XCTAssertEqual(value, true)
    }
    
    // 2^4 = 16
    func test1() {
        let value = solution.isPowerOfTwo(16)
        XCTAssertEqual(value, true)
    }
    
    func test2() {
        let value = solution.isPowerOfTwo(3)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
