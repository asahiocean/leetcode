import Foundation

// 1342. Number of Steps to Reduce a Number to Zero
// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        
        var num = num, val = 0
        
        while num != 0 {
            val += 1
            num = num % 2 == 0 ? num / 2 : num - 1
        }
        
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.numberOfSteps(14)
        XCTAssertEqual(value, 6)
    }
    func test1() {
        let value = solution.numberOfSteps(8)
        XCTAssertEqual(value, 4)
    }
    func test2() {
        let value = solution.numberOfSteps(123)
        XCTAssertEqual(value, 12)
    }
}

Tests.defaultTestSuite.run()
