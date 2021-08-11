import Foundation

// https://leetcode.com/problems/merge-sorted-array/
// Discuss: https://vk.cc/c3OlEM

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1
        while i >= 0 || j >= 0 {
            let n = i+j+1
            j < 0 || (i >= 0 && nums1[i] > nums2[j]) ? (nums1[n] = nums1[i], i -= 1) : (nums1[n] = nums2[j], j -= 1)
        }
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.040 (0.042) seconds

class Tests: XCTestCase {
    let s = Solution()
    func test0() {
        var nums = [1,2,3,0,0,0]
        s.merge(&nums, 3, [2,5,6], 3)
        XCTAssertEqual(nums, [1,2,2,3,5,6])
    }
    func test1() {
        var nums = [1]
        s.merge(&nums, 1, [], 0)
        XCTAssertEqual(nums, [1])
    }
    func test2() {
        var nums = [0]
        s.merge(&nums, 0, [1], 1)
        XCTAssertEqual(nums, [1])
    }
}

Tests.defaultTestSuite.run()
