import Foundation

// 860. Lemonade Change
// https://leetcode.com/problems/lemonade-change/

class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for b in bills {
            switch b {
            case 5:
                five += 1
            case 10:
                ten += 1
                if five < 1 { return false }
                five -= 1
            case 20:
                if five < 1 || ten < 1, five < 3 { return false }
                if ten >= 1 { ten -= 1; five -= 1 } else { five -= 3 }
            default: break
            }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /*
     From the first 3 customers, we collect three $5 bills in order.
     From the fourth customer, we collect a $10 bill and give back a $5.
     From the fifth customer, we give a $10 bill and a $5 bill.
     Since all customers got correct change, we output true.
     */
    func test0() {
        let value = solution.lemonadeChange([5,5,5,10,20])
        XCTAssertEqual(value, true)
    }
    
    /*
     From the first two customers in order, we collect two $5 bills.
     For the next two customers in order, we collect a $10 bill and give back a $5 bill.
     For the last customer, we can not give the change of $15 back because we only have two $10 bills.
     Since not every customer received the correct change, the answer is false.
     */
    func test1() {
        let value = solution.lemonadeChange([5,5,10,10,20])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
