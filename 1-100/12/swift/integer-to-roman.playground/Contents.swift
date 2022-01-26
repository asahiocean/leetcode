import Foundation

// 12. Integer to Roman
// https://leetcode.com/problems/integer-to-roman/

class Solution {
    
    private let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    private let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    func intToRoman(_ num: Int) -> String {
        
        var int = num
        var sym = ""
        
        while int > 0 {
            for (i, d) in values.enumerated() where int - d >= 0 {
                int -= d
                sym += symbols[i]
                break
            }
        }
        return sym
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.013 (0.015) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 3 is represented as 3 ones.
    func test0() {
        let value = solution.intToRoman(3)
        XCTAssertEqual(value, "III")
    }
    
    // L = 50, V = 5, III = 3.
    func test1() {
        let value = solution.intToRoman(58)
        XCTAssertEqual(value, "LVIII")
    }
    
    // M = 1000, CM = 900, XC = 90 and IV = 4.
    func test2() {
        let value = solution.intToRoman(1994)
        XCTAssertEqual(value, "MCMXCIV")
    }
}

Tests.defaultTestSuite.run()
