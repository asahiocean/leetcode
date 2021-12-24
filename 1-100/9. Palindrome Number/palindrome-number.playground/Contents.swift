import Foundation

// 9. Palindrome Number
// https://leetcode.com/problems/palindrome-number/

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        return x < 0 ? false : method(x: x) == x
    }
    private func method(x: Int) -> Int {
        var r = 0
        var x = x
        while x != 0 {
            r = r * 10
            r = r + x % 10
            x /= 10
        }
        return (r < Int32.min || r > Int32.max) ? 0 : r
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isPalindrome(121)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isPalindrome(-121)
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.isPalindrome(10)
        XCTAssertEqual(value, false)
    }
    
    func test3() {
        let value = solution.isPalindrome(-101)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
