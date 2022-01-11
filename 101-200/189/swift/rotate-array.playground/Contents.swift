import Foundation

// 189. Rotate Array
// https://leetcode.com/problems/rotate-array/

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var val = 0
        while val < k, let last = nums.last {
            nums.insert(last, at: 0)
            nums.removeLast()
            val += 1
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // rotate 1 steps to the right: [7,1,2,3,4,5,6]
    // rotate 2 steps to the right: [6,7,1,2,3,4,5]
    // rotate 3 steps to the right: [5,6,7,1,2,3,4]
    func test0() {
        var array = [1,2,3,4,5,6,7]
        solution.rotate(&array, 3)
        XCTAssertEqual(array, [5,6,7,1,2,3,4])
    }
    
    // rotate 1 steps to the right: [99,-1,-100,3]
    // rotate 2 steps to the right: [3,99,-1,-100]
    func test1() {
        var array = [-1,-100,3,99]
        solution.rotate(&array, 2)
        XCTAssertEqual(array, [3,99,-1,-100])
    }
}

Tests.defaultTestSuite.run()
