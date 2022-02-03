import Foundation

// 454. 4Sum II
// https://leetcode.com/problems/4sum-ii/

class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var value = 0
        var counter: [Int:Int] = [:]
        let lnN1 = nums1.count
        
        for i in 0..<lnN1 {
            for j in 0..<lnN1 {
                let sum = nums1[i] + nums2[j]
                if let count = counter[sum] {
                    counter[sum] = count + 1
                } else {
                    counter[sum] = 1
                }
            }
        }
        
        for i in 0..<lnN1 {
            for j in 0..<lnN1 {
                if let count = counter[-(nums3[i] + nums4[j])] {
                    value += count
                }
            }
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The two tuples are:
    // 1. (0, 0, 0, 1) -> nums1[0] + nums2[0] + nums3[0] + nums4[1] = 1 + (-2) + (-1) + 2 = 0
    // 2. (1, 1, 0, 0) -> nums1[1] + nums2[1] + nums3[0] + nums4[0] = 2 + (-1) + (-1) + 0 = 0
    func test0() {
        let value = solution.fourSumCount([1,2], [-2,-1], [-1,2], [0,2])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.fourSumCount([0], [0], [0], [0])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
