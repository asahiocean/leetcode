import Foundation

// 283. Move Zeroes
// https://leetcode.com/problems/move-zeroes/

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0, zero = 0
        while i < nums.count - zero {
            if nums[i] == 0 {
                zero += 1
                nums.append(0)
                nums.remove(at: i)
            } else {
                i += 1
            }
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        var array = [0,1,0,3,12]
        solution.moveZeroes(&array)
        XCTAssertEqual(array, [1,3,12,0,0])
    }
    
    func test1() {
        var array = [0]
        solution.moveZeroes(&array)
        XCTAssertEqual(array, [0])
    }
}

Tests.defaultTestSuite.run()
