import Foundation

// 413. Arithmetic Slices
// https://leetcode.com/problems/arithmetic-slices/

class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        let len = nums.count
        guard len > 2 else { return 0 }
        
        var num = 0
        var arrs = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
        
        for i in 1..<len-1 where (nums[i] * 2) == (nums[i-1] + nums[i+1]) {
            arrs[i-1][i+1] = true
            num += 1
        }
        
        guard len > 3 else { return num }
        
        for ssl in (4...len) { // subsequence length
            for p in 0...(len - ssl) {
                let idx = (p + ssl - 1) // end idx
                if 2 * nums[idx-1] == (nums[idx] + nums[idx-2]) && arrs[p][idx-1] {
                    arrs[p][idx] = true
                    num += 1
                }
            }
        }
        return num
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // We have 3 arithmetic slices in nums: [1, 2, 3], [2, 3, 4] and [1,2,3,4] itself.
    func test0() {
        let value = solution.numberOfArithmeticSlices([1,2,3,4])
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.numberOfArithmeticSlices([1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
