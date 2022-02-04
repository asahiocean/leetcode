import Foundation

// 164. Maximum Gap
// https://leetcode.com/problems/maximum-gap/

class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        let len = nums.count
        let minEl = nums.min()!, maxEl = nums.max()!
        
        let d = max(1, (maxEl - minEl) / (len - 1))
        var buckets = [[Int]](repeating: [-1,-1], count: (maxEl - minEl) / d + 1)
        
        for idx in 0..<len {
            let bIdx = (nums[idx] - minEl) / d
            buckets[bIdx] = buckets[bIdx][0] == -1 ? [nums[idx], nums[idx]] : [min(buckets[bIdx][0], nums[idx]), max(buckets[bIdx][1], nums[idx])]
        }
        
        var prev = -1, result = 0
        
        for b in buckets where b[0] != -1 {
            guard prev != -1 else {
                prev = b[1]
                continue
            }
            result = max(result, b[0] - prev)
            prev = b[1]
        }
        
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The sorted form of the array is [1,3,6,9], either (3,6) or (6,9) has the maximum difference 3.
    func test0() {
        let value = solution.maximumGap([3,6,9,1])
        XCTAssertEqual(value, 3)
    }
    
    // The array contains less than 2 elements, therefore return 0.
    func test1() {
        let value = solution.maximumGap([10])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
