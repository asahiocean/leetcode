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
