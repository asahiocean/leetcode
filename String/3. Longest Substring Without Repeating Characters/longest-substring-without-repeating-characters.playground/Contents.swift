import Foundation

// https://leetcode.com/problems/longest-substring-without-repeating-characters/
// Given a string s, find the length of the longest substring without repeating characters.

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var length = 0, chars = [Character]()
        s.forEach({
            if chars.contains($0) {
                chars.removeSubrange(0...chars.firstIndex(of: $0)!)
            }
            chars.append($0)
            length = max(length, chars.count)
        })
        return length
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.032 (0.034) seconds
class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        // Input: s = "abcabcbb"
        // Output: 3
        // Explanation: The answer is "abc", with the length of 3.
        XCTAssertEqual(s.lengthOfLongestSubstring("abcabcbb"), 3) // success
    }
    func testExample2() {
        // Input: s = "bbbbb"
        // Output: 1
        // Explanation: The answer is "b", with the length of 1.
        XCTAssertEqual(s.lengthOfLongestSubstring("bbbbb"), 1) // success
    }
    func testExample3() {
        // Input: s = "pwwkew"
        // Output: 3
        // Explanation: The answer is "wke", with the length of 3.
        XCTAssertEqual(s.lengthOfLongestSubstring("pwwkew"), 3) // success
    }
    func testExample4() {
        // Input: s = ""
        // Output: 0
        XCTAssertEqual(s.lengthOfLongestSubstring(""), 0) // success
    }
}

Tests.defaultTestSuite.run()
