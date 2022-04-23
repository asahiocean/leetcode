import Foundation

// 162. Find Peak Element
// https://leetcode.com/problems/find-peak-element/

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var val = 0, len = Int(nums.indices.last ?? 0)
        while val < len {
            let mid = val + (len - val) / 2
            nums[mid] < nums[mid + 1] ? (val = mid + 1) : (len = mid)
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findPeakElement([1,2,3,1])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.findPeakElement([1,2,1,3,5,6,4])
        XCTAssertEqual(value, 5)
    }
}

Tests.defaultTestSuite.run()
