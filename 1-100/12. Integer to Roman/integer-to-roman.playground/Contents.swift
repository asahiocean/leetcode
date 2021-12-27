import Foundation

// 12. Integer to Roman
// https://leetcode.com/problems/integer-to-roman/

class Solution {
    
    private let decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    private let numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    func intToRoman(_ num: Int) -> String {
        
        var num = num
        var result = ""
        
        while num > 0 {
            for (i, d) in decimals.enumerated() where num - d >= 0 {
                num -= d
                result += numerals[i]
                break
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 5 tests, with 0 failures (0 unexpected) in 0.033 (0.035) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        XCTAssertEqual(solution.intToRoman(3), "III")
    }
    func test1() {
        XCTAssertEqual(solution.intToRoman(4), "IV")
    }
    func test2() {
        XCTAssertEqual(solution.intToRoman(9), "IX")
    }
    func test3() {
        XCTAssertEqual(solution.intToRoman(58), "LVIII")
    }
    func test4() {
        XCTAssertEqual(solution.intToRoman(1994), "MCMXCIV")
    }
}

Tests.defaultTestSuite.run()
