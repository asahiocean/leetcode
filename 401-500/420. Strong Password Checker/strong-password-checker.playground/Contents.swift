import Foundation

// 420. Strong Password Checker
// https://leetcode.com/problems/strong-password-checker/

class Solution {
    func strongPasswordChecker(_ password: String) -> Int {
        
        let array = Array(password)
        let length = array.count
        
        var low = false, up = false, num = false
        
        var types: Int = 3
        
        for el in array {
            if el.isLowercase { low = true }
            if el.isUppercase { up = true }
            if el.isNumber { num = true }
        }
        
        if low { types -= 1 }
        if up { types -= 1 }
        if num { types -= 1 }
        
        var one = 0, two = 0, rep = 0, i = 2
        
        while i < length {
            let val1 = array[i]
            if val1 == array[i-1] && val1 == array[i-2] {
                var l = 2
                while i < length && array[i] == array[i-1] {
                    l += 1
                    i += 1
                }
                rep += l / 3
                
                if l % 3 == 0 { one += 1 }
                if l % 3 == 1 { two += 1 }
            } else {
                i += 1
            }
        }
        
        if length <= 20 {
            return max(types, length < 6 ? 6 - length : rep)
        }
        
        let del = length - 20
        rep -= min(del, one)
        rep -= (min(max(del - one, 0), two * 2) / 2)
        rep -= (max(del - one - 2 * two, 0) / 3)
        return max(types, rep) + del
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.strongPasswordChecker("1337C0d3")
        XCTAssertEqual(value, 0)
    }
    
    func test1() {
        let value = solution.strongPasswordChecker("aaa111")
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.strongPasswordChecker("aaa123")
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
