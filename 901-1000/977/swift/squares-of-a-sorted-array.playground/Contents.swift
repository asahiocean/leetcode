import Foundation

// 977. Squares of a Sorted Array
// https://leetcode.com/problems/squares-of-a-sorted-array/

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        return nums.map({$0*$0}).sorted()
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // After squaring, the array becomes [16,1,0,9,100].
    // After sorting, it becomes [0,1,9,16,100].
    func test0() {
        let value = solution.sortedSquares([-4,-1,0,3,10])
        XCTAssertEqual(value, [0,1,9,16,100])
    }
    
    func test1() {
        let value = solution.sortedSquares([-7,-3,2,3,11])
        XCTAssertEqual(value, [4,9,9,49,121])
    }
}

Tests.defaultTestSuite.run()
