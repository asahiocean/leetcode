import Foundation

// 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix/

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        if strs.isEmpty { return "" }
        var common = strs[0]
        
        for ch in strs {
            while !ch.hasPrefix(common) {
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
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.longestCommonPrefix(["flower","flow","flight"])
        XCTAssertEqual(value, "fl")
    }
    
    // There is no common prefix among the input strings.
    func test1() {
        let value = solution.longestCommonPrefix(["dog","racecar","car"])
        XCTAssertEqual(value, "")
    }
}

Tests.defaultTestSuite.run()
