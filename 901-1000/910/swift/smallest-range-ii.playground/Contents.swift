import Foundation

// 910. Smallest Range II
// https://leetcode.com/problems/smallest-range-ii/

class Solution {
    func smallestRangeII(_ nums: [Int], _ k: Int) -> Int {
        let sort = nums.sorted()
        let len = sort.count
        var res = sort[len - 1] - sort[0]
        for i in 0..<len - 1 {
            let elem = (max: max(sort[len-1] - k, sort[i] + k),
                        min: min(sort[0] + k, sort[i+1] - k))
            res = min(res, elem.max - elem.min)
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The score is max(nums) - min(nums) = 1 - 1 = 0.
    func test0() {
        let value = solution.smallestRangeII([1],0)
        XCTAssertEqual(value, 0)
    }
    
    // Change nums to be [2, 8]. The score is max(nums) - min(nums) = 8 - 2 = 6.
    func test1() {
        let value = solution.smallestRangeII([0,10],2)
        XCTAssertEqual(value, 6)
    }
    
    // Change nums to be [4, 6, 3]. The score is max(nums) - min(nums) = 6 - 3 = 3.
    func test2() {
        let value = solution.smallestRangeII([1,3,6],3)
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
