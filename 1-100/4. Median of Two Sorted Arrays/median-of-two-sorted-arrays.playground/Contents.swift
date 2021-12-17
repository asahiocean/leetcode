import Foundation

// 4. Median of Two Sorted Arrays
// https://leetcode.com/problems/median-of-two-sorted-arrays/

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let n1count = nums1.count
        let n2count = nums2.count
        
        var array = Array(repeating: 0, count: n1count + n2count)
        
        var i = n1count - 1, t = n2count - 1, c = n1count + n2count - 1
        
        while c >= 0 {
            if t < 0 || i >= 0 && nums1[i] > nums2[t] {
                array[c] = nums1[i]
                i = i - 1
            } else {
                array[c] = nums2[t]
                t = t - 1
            }
            c = c - 1
        }
        let x = array.count / 2
        return array.count % 2 == 0 ? Double(array[x-1] + array[x]) / 2 : Double(array[x])
    }
}

// MARK: - Test cases -

// Result: Executed 5 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findMedianSortedArrays([1,3], [2])
        XCTAssertEqual(value, 2.00000)
    }
    func test1() {
        let value = solution.findMedianSortedArrays([1,2], [3,4])
        XCTAssertEqual(value, 2.50000)
    }
    func test2() {
        let value = solution.findMedianSortedArrays([0,0], [0,0])
        XCTAssertEqual(value, 0.00000)
    }
    func test3() {
        let value = solution.findMedianSortedArrays([], [1])
        XCTAssertEqual(value, 1.00000)
    }
    func test4() {
        let value = solution.findMedianSortedArrays([2], [])
        XCTAssertEqual(value, 2.00000)
    }
}

Tests.defaultTestSuite.run()
