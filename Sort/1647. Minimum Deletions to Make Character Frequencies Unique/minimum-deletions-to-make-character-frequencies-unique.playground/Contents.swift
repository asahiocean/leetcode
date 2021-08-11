import Foundation

// 1647. Minimum Deletions to Make Character Frequencies Unique
// https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/

class Solution {
    func minDeletions(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        
        var count: Int = 0
        
        var dict: [Character:Int] = [:]
        s.forEach({ dict[$0, default: 0] += 1 })
        
        var set: Set<Int> = []
        dict.forEach({
            guard var value = dict[$0.key] else { return }
            while set.contains(value) {
                value -= 1
                count += 1
            }
            if value > 0 { set.insert(value) }
        })
        return count
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.031 (0.033) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.minDeletions("aab")
        XCTAssertEqual(res, 0)
    }
    func test1() {
        let res = s.minDeletions("aaabbbcc")
        XCTAssertEqual(res, 2)
    }
    func test2() {
        let res = s.minDeletions("ceabaacb")
        XCTAssertEqual(res, 2)
    }
}

Tests.defaultTestSuite.run()
