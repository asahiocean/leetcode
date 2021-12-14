import Foundation

// 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix/

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var common = strs[0]
        strs.forEach {
            while !$0.hasPrefix(common) {
                common = String(common.dropLast())
            }
        }
        return common
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func test0() {
        XCTAssertEqual(s.longestCommonPrefix(["flower","flow","flight"]), "fl")
    }
    func test1() {
        XCTAssertEqual(s.longestCommonPrefix(["dog","racecar","car"]), "")
    }
}

Tests.defaultTestSuite.run()
