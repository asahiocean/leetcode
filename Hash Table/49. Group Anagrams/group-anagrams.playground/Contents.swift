import Foundation

// 49. Group Anagrams
// https://leetcode.com/problems/group-anagrams/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[Character]:[String]]()
        for ch in strs {
            let abc = ch.sorted()
            dict[abc] == nil ? (dict[abc] = [ch]) : (dict[abc]?.append(ch))
        }
        return dict.map({$1})
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.041 (0.043) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
        let expected = [["nat","tan"],["bat"],["ate","eat","tea"]]
        XCTAssertEqual(value.count, expected.count)
        XCTAssertEqual(value.count, 3)
        value.forEach {
            XCTAssertTrue(expected.contains($0.sorted()))
        }
    }
    func test1() {
        let val = solution.groupAnagrams([""])
        XCTAssertEqual(val, [[""]])
    }
    func test2() {
        let val = solution.groupAnagrams(["a"])
        XCTAssertEqual(val, [["a"]])
    }
}

Tests.defaultTestSuite.run()
