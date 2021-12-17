import Foundation

// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var length = 0, chars = [Character]()
        for ch in s {
            if chars.contains(ch), let fi = chars.firstIndex(of: ch) {
                chars.removeSubrange(0...fi)
            }
            chars.append(ch)
            length = max(length, chars.count)
        }
        return length
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.lengthOfLongestSubstring("abcabcbb")
        XCTAssertEqual(value, 3)
    }
    func test1() {
        let value = solution.lengthOfLongestSubstring("bbbbb")
        XCTAssertEqual(value, 1)
    }
    func test2() {
        let value = solution.lengthOfLongestSubstring("pwwkew")
        XCTAssertEqual(value, 3)
    }
    func test3() {
        let value = solution.lengthOfLongestSubstring("")
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
