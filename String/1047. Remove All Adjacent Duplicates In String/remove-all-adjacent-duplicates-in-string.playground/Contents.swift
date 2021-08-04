import Foundation

// 1047. Remove All Adjacent Duplicates In String
// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/

class Solution {
    func removeDuplicates(_ s: String) -> String {
        var result = ""
        s.forEach {
            if let last = result.last, last == $0 {
                result.removeLast()
            } else {
                result.append($0)
            }
        }
        return result
    }
}

import XCTest

//     Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.removeDuplicates("abbaca")
        XCTAssertEqual(res, "ca")
    }
    func test1() {
        let res = s.removeDuplicates("azxxzy")
        XCTAssertEqual(res, "ay")
    }
}

Tests.defaultTestSuite.run()
