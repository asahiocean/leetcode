import Foundation

// 4. Median of Two Sorted Arrays
// https://leetcode.com/problems/median-of-two-sorted-arrays/

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let lenN1 = nums1.count, lenN2 = nums2.count
        
        var arr = [Int](repeating: 0, count: lenN1 + lenN2)
        
        var valA = lenN1 - 1,
            valB = lenN2 - 1,
            valC = lenN1 + lenN2 - 1
        
        while valC >= 0 {
            if valB < 0 || valA >= 0 && nums1[valA] > nums2[valB] {
                arr[valC] = nums1[valA]
                valA = (valA - 1)
            } else {
                arr[valC] = nums2[valB]
                valB = (valB - 1)
            }
            valC = valC - 1
        }
        let lenArr = arr.count, mid = (lenArr / 2)
        return lenArr % 2 == 0 ? Double(arr[mid-1] + arr[mid]) / 2 : Double(arr[mid])
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // merged array = [1,2,3] and median is 2.
    func test0() {
        let value = solution.findMedianSortedArrays([1,3], [2])
        XCTAssertEqual(value, 2.00000)
    }
    
    // merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
    func test1() {
        let value = solution.findMedianSortedArrays([1,2], [3,4])
        XCTAssertEqual(value, 2.50000)
    }
}

Tests.defaultTestSuite.run()
