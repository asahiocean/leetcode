import Foundation

// 384. Shuffle an Array
// https://leetcode.com/problems/shuffle-an-array/

class Solution {
    
    private(set) var nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func reset() -> [Int] {
        return nums
    }
    
    func shuffle() -> [Int] {
        var vals = nums
        let count = nums.count
        for i in 0..<count {
            vals.swapAt(i, .random(in: i..<count))
        }
        return vals
    }
}

// MARK: - Test cases -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.006 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    let solution = Solution([1, 2, 3])
    
    func test0() {
        solution.shuffle()
        XCTAssertEqual(solution.nums, [1,2,3])
        let reset = solution.reset()
        XCTAssertEqual(reset, [1,2,3])
    }
}

Tests.defaultTestSuite.run()

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
