import Foundation

// 13. Roman to Integer
// https://leetcode.com/problems/roman-to-integer/

class Solution {
    
    private let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
    
    func romanToInt(_ s: String) -> Int {
        var prev = 0, out = 0
        for i in s {
            let val = dict[i] ?? 0
            out += val <= prev ? prev : -prev
            prev = val
        }
        out += prev
        return out
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // III = 3
    func test0() {
        let value = solution.romanToInt("III")
        XCTAssertEqual(value, 3)
    }
    
    // L = 50, V = 5, III = 3
    func test1() {
        let value = solution.romanToInt("LVIII")
        XCTAssertEqual(value, 58)
    }
    
    // M = 1000, CM = 900, XC = 90 and IV = 4
    func test2() {
        let value = solution.romanToInt("MCMXCIV")
        XCTAssertEqual(value, 1994)
    }
}

Tests.defaultTestSuite.run()
