import Foundation

// 1790. Check if One String Swap Can Make Strings Equal
// https://leetcode.com/problems/check-if-one-string-swap-can-make-strings-equal/

class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        guard s1 != s2 else { return true }
        
        let arrS1 = Array(s1), arrS2 = Array(s2)
        var one: Int?, two: Int?
        
        for i in 0..<s1.count where arrS1[i] != arrS2[i] {
            guard two == nil else { return false }
            if one == nil { one = i } else { two = i }
        }
        guard let one = one, let two = two else { return false }
        return arrS1[one] == arrS2[two] && arrS1[two] == arrS2[one]
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // For example, swap the first character with the last character of s2 to make "bank".
    func test0() {
        let value = solution.areAlmostEqual("bank", "kanb")
        XCTAssertEqual(value, true)
    }
    
    // It is impossible to make them equal with one string swap.
    func test1() {
        let value = solution.areAlmostEqual("attack", "defend")
        XCTAssertEqual(value, false)
    }
    
    // The two strings are already equal, so no string swap operation is required.
    func test2() {
        let value = solution.areAlmostEqual("kelb", "kelb")
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()
