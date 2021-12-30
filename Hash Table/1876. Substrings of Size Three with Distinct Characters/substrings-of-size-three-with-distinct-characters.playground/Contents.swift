import Foundation

// https://leetcode.com/problems/substrings-of-size-three-with-distinct-characters

class Solution {
    func countGoodSubstrings(_ s: String) -> Int {
        guard s.count > 2 else { return 0 }
        let c = [Character](s)
        var i = 0, count = 0
        while i <= (s.count - 3) {
            if c[i] != c[i+1] && c[i+1] != c[i+2] && c[i] != c[i+2] {
                count += 1
            }
            i += 1
        }
        return count
    }
}

import XCTest

//     Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.countGoodSubstrings("xyzzaz")
        XCTAssertEqual(res, 1)
    }
    func test2() {
        let res = s.countGoodSubstrings("aababcabc")
        XCTAssertEqual(res, 4)
    }
}

Tests.defaultTestSuite.run()
