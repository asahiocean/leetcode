import Foundation

// 242. Valid Anagram
// https://leetcode.com/problems/valid-anagram/

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return s.sorted() == t.sorted()
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

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
