import Foundation

// 1668. Maximum Repeating Substring
// https://leetcode.com/problems/maximum-repeating-substring/

class Solution {
    func maxRepeating(_ sequence: String, _ word: String) -> Int {
        let max = sequence.count / word.count
        guard max > 0 else { return 0 }
        var result = 0
        for count in 1...max where sequence.contains(String(repeating: word, count: count)) {
            result = count
        }
        return result
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
