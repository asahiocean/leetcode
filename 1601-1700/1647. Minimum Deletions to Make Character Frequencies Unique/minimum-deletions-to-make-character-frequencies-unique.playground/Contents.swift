import Foundation

// 1647. Minimum Deletions to Make Character Frequencies Unique
// https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/

class Solution {
    func minDeletions(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var res = 0, set = Set<Int>()
        let dict = Dictionary(s.map({($0, 1)}), uniquingKeysWith: +)
        dict.forEach {
            guard var idx = dict[$0.key] else { return }
            while set.contains(idx) {
                idx -= 1
                res += 1
            }
            if idx > 0 { set.insert(idx) }
        }
        return res
    }
}

// MARK: - Test Cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.021 (0.023) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.minDeletions("aab")
        XCTAssertEqual(res, 0)
    }
    
    func test1() {
        let res = solution.minDeletions("aaabbbcc")
        XCTAssertEqual(res, 2)
    }
    
    func test2() {
        let res = solution.minDeletions("ceabaacb")
        XCTAssertEqual(res, 2)
    }
}

Tests.defaultTestSuite.run()
