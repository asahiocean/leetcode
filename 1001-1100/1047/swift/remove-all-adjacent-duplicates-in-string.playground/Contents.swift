import Foundation

// 1047. Remove All Adjacent Duplicates In String
// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/

class Solution {
    func removeDuplicates(_ s: String) -> String {
        var value = ""
        for ch in s {
            if value.last != ch {
                value.append(ch)
            } else {
                value.removeLast()
            }
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal,
    // and this is the only possible move.  The result of this move is that the string is "aaca",
    // of which only "aa" is possible, so the final string is "ca".
    func test0() {
        let res = solution.removeDuplicates("abbaca")
        XCTAssertEqual(res, "ca")
    }
    
    func test1() {
        let res = solution.removeDuplicates("azxxzy")
        XCTAssertEqual(res, "ay")
    }
}

Tests.defaultTestSuite.run()
