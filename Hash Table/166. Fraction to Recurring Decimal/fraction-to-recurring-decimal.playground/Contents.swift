import Foundation

// https://leetcode.com/problems/fraction-to-recurring-decimal/

class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        var num = numerator, den = denominator
        var result = [String]()
        
        guard num != 0 else { return "0" }
        
        if (num > 0 && den < 0) || (num < 0 && den > 0) {
            result.append("-")
        }
        
        num = abs(num)
        den = abs(den)
        
        result.append(String(num/den))
        num %= den
        
        guard num != 0 else { return result.joined() }
        
        result.append(".")
        var map = [Int:Int]()
        map[num] = result.count
        
        while num != 0 {
            num *= 10
            result.append(String(num / den))
            num %= den
            if let value = map[num] {
                let index = value
                result.insert("(", at: index)
                result.append(")")
                break
            } else {
                map[num] = result.count
            }
        }
        return result.joined()
    }
}

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.081 (0.083) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssert(s.fractionToDecimal(1, 2) == "0.5") // success
    }
    func testExample2() {
        XCTAssert(s.fractionToDecimal(2, 1) == "2") // success
    }
    func testExample3() {
        XCTAssert(s.fractionToDecimal(2, 3) == "0.(6)") // success
    }
    func testExample4() {
        XCTAssert(s.fractionToDecimal(4, 333) == "0.(012)") // success
    }
    func testExample5() {
        XCTAssert(s.fractionToDecimal(1, 5) == "0.2") // success
    }
}

Tests.defaultTestSuite.run()
