import Foundation

// 896. Monotonic Array
// https://leetcode.com/problems/monotonic-array/

class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        var incr = false, decr = false
        
        for i in nums.indices.dropLast() {
            if nums[i] > nums[i+1] {
                incr = true
            } else if nums[i] < nums[i+1] {
                decr = true
            }
            guard !(incr && decr) else { return false }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isMonotonic([1,2,2,3])
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isMonotonic([6,5,4,4])
        XCTAssertEqual(value, true)
    }
    
    func test2() {
        let value = solution.isMonotonic([1,3,2])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
