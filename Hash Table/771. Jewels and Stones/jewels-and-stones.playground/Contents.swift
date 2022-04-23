import Foundation

// 771. Jewels and Stones
// https://leetcode.com/problems/jewels-and-stones/

class Solution {
    func numJewelsInStones(_ j: String, _ s: String) -> Int {
        return s.filter({ j.contains($0) }).count
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()

    func test0() {
        let value = solution.numJewelsInStones("aA", "aAAbbbb")
        XCTAssertEqual(value, 3)
    }

    func test1() {
        let value = solution.numJewelsInStones("z", "ZZ")
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
