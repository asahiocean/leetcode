import Foundation

// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        var len = 0
        var chars: [Character] = []
        
        for ch in s {
            if chars.contains(ch), let idx = chars.firstIndex(of: ch) {
                chars.removeSubrange(0...idx)
            }
            chars.append(ch)
            len = max(len, chars.count)
        }
        return len
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The answer is "abc", with the length of 3.
    func test0() {
        let value = solution.lengthOfLongestSubstring("abcabcbb")
        XCTAssertEqual(value, 3)
    }
    
    // The answer is "b", with the length of 1.
    func test1() {
        let value = solution.lengthOfLongestSubstring("bbbbb")
        XCTAssertEqual(value, 1)
    }
    
    // The answer is "wke", with the length of 3.
    // Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
    func test2() {
        let value = solution.lengthOfLongestSubstring("pwwkew")
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
