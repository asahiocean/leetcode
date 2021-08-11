import Foundation

// https://leetcode.com/problems/first-unique-character-in-a-string/
// Discuss: https://vk.cc/c3KIil

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var arr = Array(repeating: 0, count: 26)
        let a = UnicodeScalar("a").value
        s.unicodeScalars.forEach{
            arr[Int($0.value - a)] += 1
        }
        var iter = 0
        for ch in s.unicodeScalars {
            if arr[Int(ch.value - a)] == 1 { return iter }
            iter += 1
        }
        return -1
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.045 (0.048) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.firstUniqChar("leetcode")
        XCTAssertEqual(res, 0)
    }
    func test1() {
        let res = s.firstUniqChar("loveleetcode")
        XCTAssertEqual(res, 2)
    }
    func test2() {
        let res = s.firstUniqChar("aabb")
        XCTAssertEqual(res, -1)
    }
}

Tests.defaultTestSuite.run()
