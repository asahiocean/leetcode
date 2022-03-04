import Foundation

// 389. Find the Difference
// https://leetcode.com/problems/find-the-difference/

class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var dict: [Character:Int] = [:]
        for ch in s { dict[ch, default: 0] += 1 }
        for ch in t {
            guard let pos = dict[ch], pos > 0 else { return ch }
            dict[ch] = pos - 1
        }
        return "0"
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 'e' is the letter that was added.
    func test0() {
        let value = solution.findTheDifference("abcd", "abcde")
        XCTAssertEqual(value, "e")
    }
    
    func test1() {
        let value = solution.findTheDifference("", "y")
        XCTAssertEqual(value, "y")
    }
}

Tests.defaultTestSuite.run()
