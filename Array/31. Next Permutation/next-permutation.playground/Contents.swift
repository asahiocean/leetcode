import Foundation

// 31. Next Permutation
// https://leetcode.com/problems/next-permutation/
// Discuss: https://vk.cc/c47dqh

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var l = -1, i = nums.count - 2
        while i >= 0 {
            if nums[i] < nums[i+1] { l = i; break }
            i -= 1
        }
        guard l != -1 else {
            nums = Array(nums.reversed())
            return
        }
        var r = -1
        i = nums.count - 1
        while i > l {
            if nums[i] > nums[l] { r = i; break }
            i -= 1
        }
        nums.swapAt(l, r)
        let arr: [Int] = Array(nums[l+1...nums.count - 1])
        nums.replaceSubrange(l + 1..<nums.count, with: Array(arr).reversed())
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.111 (0.113) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        var nums = [1,2,3]
        s.nextPermutation(&nums)
        XCTAssertEqual(nums, [1,3,2])
    }
    func test1() {
        var nums = [3,2,1]
        s.nextPermutation(&nums)
        XCTAssertEqual(nums, [1,2,3])
    }
    func test2() {
        var nums = [1,1,5]
        s.nextPermutation(&nums)
        XCTAssertEqual(nums, [1,5,1])
    }
    func test3() {
        var nums = [1]
        s.nextPermutation(&nums)
        XCTAssertEqual(nums, [1])
    }
}

Tests.defaultTestSuite.run()
