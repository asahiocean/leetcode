import Foundation

// 29. Divide Two Integers
// https://leetcode.com/problems/divide-two-integers/

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let negative = (dividend < 0) == (divisor < 0)
        var _dividend = Int64(abs(dividend))
        let _divisor = Int64(abs(divisor))
        
        var count = 0, t = 1, divisor = _divisor
        
        while divisor < _dividend {
            divisor = divisor << 1
            t = t << 1
        }
        
        while divisor > 0, divisor > _divisor {
            while divisor > _dividend {
                divisor = divisor >> 1
                t = t >> 1
            }
            _dividend -= divisor
            count += t
        }
        if _dividend == _divisor { count += 1 }
        return negative ? min(count, Int(Int32.max)) : max(-count, Int(Int32.min))
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        XCTAssertEqual(solution.divide(10, 3), 3)
    }
    func test1() {
        XCTAssertEqual(solution.divide(7, -3), -2)
    }
    func test2() {
        XCTAssertEqual(solution.divide(0, -1), 0)
    }
    func test3() {
        XCTAssertEqual(solution.divide(1, 1), 1)
    }
}

Tests.defaultTestSuite.run()
