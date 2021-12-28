import Foundation

// 1773. Count Items Matching a Rule
// https://leetcode.com/problems/count-items-matching-a-rule/

class Solution {
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        let rule = ruleKey == "type" ? 0 : (ruleKey == "color" ? 1 : 2)
        return items.reduce(0) { $0 + ($1[rule] == ruleValue ? 1 : 0)}
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.013) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let items = [["phone","blue","pixel"],["computer","silver","lenovo"],["phone","gold","iphone"]]
        let matches = solution.countMatches(items, "color", "silver")
        XCTAssertEqual(matches, 1)
    }
    func test1() {
        let items = [["phone","blue","pixel"],["computer","silver","phone"],["phone","gold","iphone"]]
        let matches = solution.countMatches(items, "type", "phone")
        XCTAssertEqual(matches, 2)
    }
}

Tests.defaultTestSuite.run()
