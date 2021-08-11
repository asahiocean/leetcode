import Foundation

class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var res = Array<Character>(repeating: "a", count: indices.count)
        for i in 0 ..< indices.count { res[indices[i]] = Array(s)[i] }
        return String(res)
    }
}

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.006 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertEqual(s.restoreString("codeleet", [4,5,6,7,0,2,1,3]), "leetcode") // success
    }
    func testExample2() {
        XCTAssertEqual(s.restoreString("abc", [0,1,2]), "abc") // success
    }
    func testExample3() {
        XCTAssertEqual(s.restoreString("aiohn", [3,1,4,2,0]), "nihao") // success
    }
    func testExample4() {
        XCTAssertEqual(s.restoreString("aaiougrt", [4,0,2,6,7,3,1,5]), "arigatou") // success
    }
    func testExample5() {
        XCTAssertEqual(s.restoreString("art", [1,0,2]), "rat") // success
    }
}

Tests.defaultTestSuite.run()
