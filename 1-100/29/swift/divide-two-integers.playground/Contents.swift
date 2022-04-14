import Foundation

// 29. Divide Two Integers
// https://leetcode.com/problems/divide-two-integers/

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let neg = (dividend < 0) == (divisor < 0)
        var dnd = Int64(abs(dividend))
        let dsr = Int64(abs(divisor))
        
        var cnt = 0, val = 1, dvs = dsr
        
        while dvs < dnd {
            dvs = dvs << 1
            val = val << 1
        }
        
        while dvs > 0, dvs > dsr {
            while dvs > dnd {
                dvs = dvs >> 1
                val = val >> 1
            }
            dnd -= dvs
            cnt += val
        }
        if dnd == dsr { cnt += 1 }
        return neg ? min(cnt, Int(Int32.max)) : max(-cnt, Int(Int32.min))
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.010 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 10/3 = 3.33333.. which is truncated to 3.
    func test0() {
        let value = solution.divide(10, 3)
        XCTAssertEqual(value, 3)
    }
    
    // 7/-3 = -2.33333.. which is truncated to -2.
    func test1() {
        let value = solution.divide(7, -3)
        XCTAssertEqual(value, -2)
    }
    
    func test2() {
        let value = solution.divide(0, -1)
        XCTAssertEqual(value, 0)
    }
    
    func test3() {
        let value = solution.divide(1, 1)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
