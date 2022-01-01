import Foundation

// 1014. Best Sightseeing Pair
// https://leetcode.com/problems/best-sightseeing-pair/

class Solution {
    func maxScoreSightseeingPair(_ values: [Int]) -> Int {
        var value = 0
        var prevMax = values[0]
        for i in 1..<values.count {
            let score = values[i]
            value = max(value, prevMax + score - i)
            prevMax = max(prevMax, score + i)
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// i = 0, j = 2, values[i] + values[j] + i - j = 8 + 5 + 0 - 2 = 11
    func test0() {
        let value = solution.maxScoreSightseeingPair([8,1,5,2,6])
        XCTAssertEqual(value, 11)
    }
    
    func test1() {
        let value = solution.maxScoreSightseeingPair([1,2])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
