import Foundation

// 209. Minimum Size Subarray Sum
// https://leetcode.com/problems/minimum-size-subarray-sum/

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        
        var size: Int = .max, start = 0, sum = 0
        
        nums.enumerated().forEach {
            sum += $1
            while sum >= target, start <= $0 {
                size = min(size, $0 - start + 1)
                sum -= nums[start]
                start += 1
            }
        }
        return size == .max ? 0 : size
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.minSubArrayLen(7, [2,3,1,2,4,3])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.minSubArrayLen(4, [1,4,4])
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.minSubArrayLen(11, [1,1,1,1,1,1,1,1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
