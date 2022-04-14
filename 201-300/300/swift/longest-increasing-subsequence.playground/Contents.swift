import Foundation

// 300. Longest Increasing Subsequence
// https://leetcode.com/problems/longest-increasing-subsequence/

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var ends = [nums[0]]
        
        for i in 1..<nums.count {
            var len = ends.count, lhs = 0, rhs = len
            let num = nums[i]
            while lhs < rhs {
                let mid = (rhs - lhs) / 2 + lhs
                ends[mid] < num ? (lhs = mid + 1) : (rhs = mid)
            }
            if rhs >= len {
                ends.append(num)
            } else {
                ends[rhs] = num
            }
        }
        return ends.count
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
    func test0() {
        let value = solution.lengthOfLIS([10,9,2,5,3,7,101,18])
        XCTAssertEqual(value, 4)
    }
    
    func test1() {
        let value = solution.lengthOfLIS([0,1,0,3,2,3])
        XCTAssertEqual(value, 4)
    }
    
    func test2() {
        let value = solution.lengthOfLIS([7,7,7,7,7,7,7])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
