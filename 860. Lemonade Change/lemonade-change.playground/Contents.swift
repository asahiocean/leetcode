import Foundation

// 860. Lemonade Change
// https://leetcode.com/problems/lemonade-change/

class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for bill in bills {
            switch bill {
            case 5:
                five += 1
            case 10:
                ten += 1
                if five < 1 { return false }
                five -= 1
            case 20:
                if five < 1 || ten < 1, five < 3 { return false }
                ten >= 1 ? (ten -= 1, five -= 1) : ((five -= 3),())
            default: break
            }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.lemonadeChange([5,5,5,10,20])
        XCTAssertEqual(value, true)
    }
    func test1() {
        let value = solution.lemonadeChange([5,5,10])
        XCTAssertEqual(value, true)
    }
    func test2() {
        let value = solution.lemonadeChange([10,10])
        XCTAssertEqual(value, false)
    }
    func test3() {
        let value = solution.lemonadeChange([5,5,10,10,20])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
