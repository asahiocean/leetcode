import Foundation

// 1431. Kids With the Greatest Number of Candies
// https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/

class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        guard let maxValue = candies.max() else { return [] }
        return candies.map { $0 + extraCandies >= maxValue ? true : false }
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.030 (0.032) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.kidsWithCandies([2,3,5,1,3], 3)
        XCTAssertEqual(value, [true,true,true,false,true])
    }
    
    func test1() {
        let value = solution.kidsWithCandies([4,2,1,1,2], 1)
        XCTAssertEqual(value, [true,false,false,false,false])
    }
    
    func test2() {
        let value = solution.kidsWithCandies([12,1,12], 10)
        XCTAssertEqual(value, [true,false,true])
    }
}

Tests.defaultTestSuite.run()
