import Foundation

// 88. Merge Sorted Array
// https://leetcode.com/problems/merge-sorted-array/

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var valM = (m - 1), valN = (n - 1)
        while valM >= 0 || valN >= 0 {
            let num = valM + valN + 1
            if valN < 0 || valM >= 0 && nums1[valM] > nums2[valN] {
                nums1[num] = nums1[valM]
                valM -= 1
            } else {
                nums1[num] = nums2[valN]
                valN -= 1
            }
        }
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.020 (0.022) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        var array = [1,2,3,0,0,0]
        solution.merge(&array, 3, [2,5,6], 3)
        XCTAssertEqual(array, [1,2,2,3,5,6])
    }
    
    func test1() {
        var array = [1]
        solution.merge(&array, 1, [], 0)
        XCTAssertEqual(array, [1])
    }
    
    func test2() {
        var array = [0]
        solution.merge(&array, 0, [1], 1)
        XCTAssertEqual(array, [1])
    }
}

Tests.defaultTestSuite.run()
