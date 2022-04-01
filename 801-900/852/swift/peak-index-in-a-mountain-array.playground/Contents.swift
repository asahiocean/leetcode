import Foundation

// 852. Peak Index in a Mountain Array
// https://leetcode.com/problems/peak-index-in-a-mountain-array/

class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        
        var lhs = 0, rhs = arr.count - 1
        
        while lhs < rhs {
            let mid = (rhs - lhs) / 2 + lhs
            if arr[mid] > arr[mid + 1] {
                rhs = mid
            } else {
                lhs = mid + 1
            }
        }
        return lhs
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.peakIndexInMountainArray([0,1,0])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.peakIndexInMountainArray([0,2,1,0])
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.peakIndexInMountainArray([0,10,5,2])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
