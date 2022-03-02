import Foundation

// 283. Move Zeroes
// https://leetcode.com/problems/move-zeroes/

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var arr = nums, idx = 0, zero = 0
        while idx < arr.count - zero {
            if arr[idx] == 0 {
                zero += 1
                arr.append(0)
                arr.remove(at: idx)
            } else {
                idx += 1
            }
        }
        nums = arr
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        var nums = [0,1,0,3,12]
        solution.moveZeroes(&nums)
        XCTAssertEqual(nums, [1,3,12,0,0])
    }
    
    func test1() {
        var nums = [0]
        solution.moveZeroes(&nums)
        XCTAssertEqual(nums, [0])
    }
}

Tests.defaultTestSuite.run()
