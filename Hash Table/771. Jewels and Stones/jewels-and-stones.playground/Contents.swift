import Foundation

// https://leetcode.com/problems/jewels-and-stones/

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        return stones.filter({ jewels.contains($0) }).count
    }
}

import XCTest

//     Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertEqual(s.numJewelsInStones("aA", "aAAbbbb"), 3) // success
    }
    func testExample2() {
        XCTAssertEqual(s.numJewelsInStones("z", "ZZ"), 0) // success
    }
}

Tests.defaultTestSuite.run()
