import Foundation

// 520. Detect Capital
// https://leetcode.com/problems/detect-capital/

class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        var count = 0
        for ch in word where ch.isUppercase { count += 1 }
        switch count {
        case 0, word.count:
            return true
        case 1:
            return word.first!.isUppercase
        default:
            return false
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.detectCapitalUse("USA")
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.detectCapitalUse("FlaG")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
