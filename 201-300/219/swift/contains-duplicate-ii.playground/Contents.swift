import Foundation

// 219. Contains Duplicate II
// https://leetcode.com/problems/contains-duplicate-ii/

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 1 else { return false }
        
        var numsToLastIdx: [Int:Int] = [:]
        
        for (idx, num) in nums.enumerated() {
            if let lastIdx = numsToLastIdx[num], (idx - lastIdx) <= k {
                return true
            } else {
                numsToLastIdx[num] = idx
            }
        }
        return false
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.containsNearbyDuplicate([1,2,3,1], 3)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.containsNearbyDuplicate([1,0,1,1], 1)
        XCTAssertEqual(value, true)
    }
    
    func test2() {
        let value = solution.containsNearbyDuplicate([1,2,3,1,2,3], 2)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
