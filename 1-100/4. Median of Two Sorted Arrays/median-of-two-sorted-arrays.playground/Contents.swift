simport Foundation

// 4. Median of Two Sorted Arrays
// https://leetcode.com/problems/median-of-two-sorted-arrays/

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n1 = nums1.count, n2 = nums2.count
        var arr = Array(repeating: 0, count: n1 + n2)
        
        var i = n1 - 1, t = n2 - 1, c = n1 + n2 - 1
        
        while c >= 0 {
            if t < 0 || i >= 0 && nums1[i] > nums2[t] {
                arr[c] = nums1[i]
                c = c - 1
                i = i - 1
            } else {
                arr[c] = nums2[t]
                c = c - 1
                t = t - 1
            }
        }
        let x = arr.count / 2
        guard arr.count % 2 == 0 else { return Double(arr[x]) }
        return Double(arr[x-1] + arr[x]) / 2
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
        let res = solution.findMedianSortedArrays([1,2], [3,4])
        XCTAssertEqual(res, 2.50000)
    }
    func test2() {
        let res = solution.findMedianSortedArrays([0,0], [0,0])
        XCTAssertEqual(res, 0.00000)
    }
    func test3() {
        let res = solution.findMedianSortedArrays([], [1])
        XCTAssertEqual(res, 1.00000)
    }
    func test4() {
        let res = solution.findMedianSortedArrays([2], [])
        XCTAssertEqual(res, 2.00000)
    }
}

Tests.defaultTestSuite.run()
