import Foundation

// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/

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

// MARK: - Tests -

import XCTest

//     Executed 4 tests, with 0 failures (0 unexpected) in 0.026 (0.028) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.lengthOfLongestSubstring("abcabcbb")
        XCTAssertEqual(res, 3)
    }
    func test1() {
        let res = s.lengthOfLongestSubstring("bbbbb")
        XCTAssertEqual(res, 1)
    }
    func test2() {
        let res = s.lengthOfLongestSubstring("pwwkew")
        XCTAssertEqual(res, 3)
    }
    func test3() {
        let res = s.lengthOfLongestSubstring("")
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()
