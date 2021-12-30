import Foundation

// https://leetcode.com/problems/determine-if-two-strings-are-close

class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        typealias US = UnicodeScalar
        let az = ((US("a").value...US("z").value).map{US($0)})
        let array = Array(repeating: 0, count: az.count)
        var c1 = array, c2 = array
        word1.forEach{c1[Int($0.asciiValue!) - 97] += 1}
        word2.forEach{c2[Int($0.asciiValue!) - 97] += 1}
        for i in az.indices {
            if c1[i] > 0 && c2[i] == 0 { return false }
            if c2[i] > 0 && c1[i] == 0 { return false }
        }
        c1.sort()
        c2.sort()
        return c1 == c2
    }
}

import XCTest

//      Executed 4 tests, with 0 failures (0 unexpected) in 0.186 (0.188) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let result = s.closeStrings("abc", "bca")
        XCTAssertEqual(result, true)
    }
    func test2() {
        let result = s.closeStrings("a", "aa")
        XCTAssertEqual(result, false)
    }
    func test3() {
        let result = s.closeStrings("cabbba", "abbccc")
        XCTAssertEqual(result, true)
    }
    func test4() {
        let result = s.closeStrings("cabbba", "aabbss")
        XCTAssertEqual(result, false)
    }
}

Tests.defaultTestSuite.run()
