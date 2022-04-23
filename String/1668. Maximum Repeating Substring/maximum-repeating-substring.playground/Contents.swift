import Foundation

// 1668. Maximum Repeating Substring
// https://leetcode.com/problems/maximum-repeating-substring/

class Solution {
    func maxRepeating(_ sq: String, _ w: String) -> Int {
        let quo = sq.count / w.count
        guard quo > 0 else { return 0 }
        var res = 0
        for i in 1...quo where sq.contains(String(repeating: w, count: i)) {
            res = i
        }
        return res
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.maxRepeating("ababc","ab")
        XCTAssertEqual(res, 2)
    }
    
    func test1() {
        let res = solution.maxRepeating("ababc","ba")
        XCTAssertEqual(res, 1)
    }
    
    func test2() {
        let res = solution.maxRepeating("ababc","ac")
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()
