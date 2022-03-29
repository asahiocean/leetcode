import Foundation

// 31. Next Permutation
// https://leetcode.com/problems/next-permutation/

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var lhs = -1, rhs = -1, idx = nums.count - 2
        while idx >= 0 {
            if nums[idx] < nums[idx + 1] { lhs = idx; break }
            idx -= 1
        }
        guard lhs != -1 else {
            nums = Array(nums.reversed())
            return
        }
        
        idx = nums.count - 1
        while idx > lhs {
            if nums[idx] > nums[lhs] { rhs = idx; break }
            idx -= 1
        }
        nums.swapAt(lhs, rhs)
        let arr = [Int](nums[lhs+1...nums.count - 1])
        nums.replaceSubrange(lhs + 1..<nums.count, with: Array(arr.reversed()))
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.111 (0.113) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        var nums = [1,2,3]
        solution.nextPermutation(&nums)
        XCTAssertEqual(nums, [1,3,2])
    }
    
    func test1() {
        var nums = [3,2,1]
        solution.nextPermutation(&nums)
        XCTAssertEqual(nums, [1,2,3])
    }
    
    func test2() {
        var nums = [1,1,5]
        solution.nextPermutation(&nums)
        XCTAssertEqual(nums, [1,5,1])
    }
}

Tests.defaultTestSuite.run()
