import Foundation

// 326. Power of Three
// https://leetcode.com/problems/power-of-three/

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        var num = n
        if n < 1 { return false }
        while num % 3 == 0 { num = num / 3 }
        guard num != 1 else { return true }
        return false
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isPowerOfThree(27)
        XCTAssertEqual(value, true)
    }
    func test1() {
        let value = solution.isPowerOfThree(0)
        XCTAssertEqual(value, false)
    }
    func test2() {
        let value = solution.isPowerOfThree(9)
        XCTAssertEqual(value, true)
    }
    func test3() {
        let value = solution.isPowerOfThree(45)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
