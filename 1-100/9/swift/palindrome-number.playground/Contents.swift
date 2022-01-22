import Foundation

// 9. Palindrome Number
// https://leetcode.com/problems/palindrome-number/

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        return x < 0 ? false : helper(x) == x
    }
    
    private func helper(_ x: Int) -> Int {
        var valR = 0
        var valX = x
        while valX != 0 {
            valR = (valR * 10)
            valR = (valR + valX % 10)
            valX /= 10
        }
        return (valR < Int32.min || valR > Int32.max) ? 0 : valR
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 121 reads as 121 from left to right and from right to left.
    func test0() {
        let value = solution.isPalindrome(121)
        XCTAssertEqual(value, true)
    }
    
    // From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
    func test1() {
        let value = solution.isPalindrome(-121)
        XCTAssertEqual(value, false)
    }
    
    // Reads 01 from right to left. Therefore it is not a palindrome.
    func test2() {
        let value = solution.isPalindrome(10)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
