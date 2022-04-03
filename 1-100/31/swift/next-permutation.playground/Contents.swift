import Foundation

// 31. Next Permutation
// https://leetcode.com/problems/next-permutation/

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let len = nums.count
        var lhs = -1, rhs = -1, idx = len - 2
        while idx >= 0 {
            if nums[idx] < nums[idx + 1] { lhs = idx; break }
            idx -= 1
        }
        if lhs == -1 { nums = nums.reversed(); return }
        
        idx = len - 1
        while idx > lhs {
            rhs = idx
            if nums[idx] > nums[lhs] { break }
            idx -= 1
        }
        nums.swapAt(lhs, rhs)
        nums.replaceSubrange(lhs + 1..<len, with: nums[lhs + 1...len - 1].reversed())
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.016 (0.020) seconds

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
