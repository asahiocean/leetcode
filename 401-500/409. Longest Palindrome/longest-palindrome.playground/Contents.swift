import Foundation

// 409. Longest Palindrome
// https://leetcode.com/problems/longest-palindrome/

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var res = 0, set = Set<Character>()
        for ch in s {
            if set.contains(ch) {
                res += 2
                set.remove(ch)
            } else {
                set.insert(ch)
            }
        }
        return !set.isEmpty ? res + 1 : res
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // One longest palindrome that can be built is "dccaccd", whose length is 7.
    func test0() {
        let value = solution.longestPalindrome("abccccdd")
        XCTAssertEqual(value, 7)
    }
    
    func test1() {
        let value = solution.longestPalindrome("a")
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.longestPalindrome("bb")
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
