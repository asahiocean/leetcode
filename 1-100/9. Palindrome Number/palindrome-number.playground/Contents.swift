import Foundation

// 9. Palindrome Number
// https://leetcode.com/problems/palindrome-number/

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        let reverse = { () -> Int in
            var r = 0, x = x
            while x != 0 {
                r = r * 10
                r = r + x % 10
                x /= 10
            }
            if r < Int32.min || r > Int32.max { return 0 }
            return r
        }
        return reverse() == x
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func test0() {
        XCTAssertEqual(s.isPalindrome(121), true)
    }
    
    func test1() {
        XCTAssertEqual(s.isPalindrome(-121), false)
    }
    
    func test2() {
        XCTAssertEqual(s.isPalindrome(10), false)
    }
    
    func test3() {
        XCTAssertEqual(s.isPalindrome(-101), false)
    }
}

Tests.defaultTestSuite.run()
