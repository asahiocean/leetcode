import Foundation

// 49. Group Anagrams
// https://leetcode.com/problems/group-anagrams/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [[Character]:[String]] = [:]
        for c in strs {
            let abc = c.sorted()
            dict[abc] == nil ? (dict[abc] = [c]) : (dict[abc]?.append(c))
        }
        return dict.map({$1})
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.022 (0.024) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
        let exp = [["nat","tan"],["bat"],["ate","eat","tea"]]
        XCTAssertEqual(value.count, exp.count)
        XCTAssertEqual(value.count, 3)
        value.forEach {
            XCTAssertTrue(exp.contains($0.sorted()))
        }
    }
    func test1() {
        let value = solution.groupAnagrams([""])
        XCTAssertEqual(value, [[""]])
    }
    func test2() {
        let value = solution.groupAnagrams(["a"])
        XCTAssertEqual(value, [["a"]])
    }
}

Tests.defaultTestSuite.run()
