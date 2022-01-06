import Foundation

// 1528. Shuffle String
// https://leetcode.com/problems/shuffle-string/

class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var res = [Character](repeating: "a", count: indices.count)
        for i in 0 ..< indices.count { res[indices[i]] = Array(s)[i] }
        return String(res)
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.006 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.restoreString("codeleet", [4,5,6,7,0,2,1,3]), "leetcode")
    }
    func test1() {
        XCTAssertEqual(s.restoreString("abc", [0,1,2]), "abc")
    }
    func test2() {
        XCTAssertEqual(s.restoreString("aiohn", [3,1,4,2,0]), "nihao")
    }
    func test3() {
        XCTAssertEqual(s.restoreString("aaiougrt", [4,0,2,6,7,3,1,5]), "arigatou")
    }
    func test4() {
        XCTAssertEqual(s.restoreString("art", [1,0,2]), "rat")
    }
}

Tests.defaultTestSuite.run()
