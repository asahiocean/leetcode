import Foundation

// 242. Valid Anagram
// https://leetcode.com/problems/valid-anagram/

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let dictS = Dictionary(s.map {($0, 1)}, uniquingKeysWith: +)
        let dictT = Dictionary(t.map {($0, 1)}, uniquingKeysWith: +)
        return dictS == dictT
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isAnagram("anagram", "nagaram")
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isAnagram("rat", "car")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
