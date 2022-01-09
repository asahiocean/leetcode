import Foundation

// 125. Valid Palindrome
// https://leetcode.com/problems/valid-palindrome/

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = [Character](s.lowercased().filter { $0.isLetter || $0.isNumber })
        var idxL = 0, idxR = (chars.count - 1)
        while idxL < idxR {
            if chars[idxL] != chars[idxR] { return false }
            idxL += 1
            idxR -= 1
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.021 (0.023) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // "amanaplanacanalpanama" is a palindrome.
    func test0() {
        let value = solution.isPalindrome("A man, a plan, a canal: Panama")
        XCTAssertTrue(value)
    }
    
    // "raceacar" is not a palindrome.
    func test1() {
        let value = solution.isPalindrome("race a car")
        XCTAssertFalse(value)
    }
    
    // 's' is an empty string "" after removing non-alphanumeric characters.
    // Since an empty string reads the same forward and backward, it is a palindrome.
    func test2() {
        let value = solution.isPalindrome(" ")
        XCTAssertTrue(value)
    }
}

Tests.defaultTestSuite.run()
