import Foundation

// 680. Valid Palindrome II
// https://leetcode.com/problems/valid-palindrome-ii/

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let arr = Array(s)
        var lhs = 0, rhs = arr.count - 1
        
        while lhs < rhs {
            if arr[lhs] != arr[rhs] {
                return isValid(arr, lhs + 1, rhs) || isValid(arr, lhs, rhs - 1)
            }
            lhs += 1
            rhs -= 1
        }
        return true
    }
    // is palindrome
    private func isValid(_ s: [Character], _ l: Int, _ r: Int) -> Bool {
        var lhs = l, rhs = r
        while lhs < rhs {
            if s[lhs] != s[rhs] { return false }
            lhs += 1
            rhs -= 1
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.validPalindrome("aba")
        XCTAssertEqual(value, true)
    }
    
    // You could delete the character 'c'.
    func test1() {
        let value = solution.validPalindrome("abca")
        XCTAssertEqual(value, true)
    }
    
    func test2() {
        let value = solution.validPalindrome("abc")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
