import Foundation

// 409. Longest Palindrome
// https://leetcode.com/problems/longest-palindrome/

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        
        var visited: Set<Character> = []
        var value = 0
        
        s.forEach { (ch: Character) in
            if visited.contains(ch) {
                value += 2
                visited.remove(ch)
            } else {
                visited.insert(ch)
            }
        }
        
        return !(visited.isEmpty) ? value + 1 : value
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// One longest palindrome that can be built is "dccaccd", whose length is 7.
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
