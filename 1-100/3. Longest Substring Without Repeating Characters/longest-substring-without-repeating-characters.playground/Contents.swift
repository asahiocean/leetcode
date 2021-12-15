import Foundation

// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var length = 0, chars = [Character]()
        s.forEach {
            if chars.contains($0), let fi = chars.firstIndex(of: $0) {
                chars.removeSubrange(0...fi)
            }
            chars.append($0)
            length = max(length, chars.count)
        }
        return length
    }
}

// MARK: - Test Cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.021 (0.023) seconds

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func test0() {
        XCTAssertEqual(s.lengthOfLongestSubstring("abcabcbb"), 3)
    }
    func test1() {
        XCTAssertEqual(s.lengthOfLongestSubstring("bbbbb"), 1)
    }
    func test2() {
        XCTAssertEqual(s.lengthOfLongestSubstring("pwwkew"), 3)
    }
    func test3() {
        XCTAssertEqual(s.lengthOfLongestSubstring(""), 0)
    }
}

Tests.defaultTestSuite.run()
