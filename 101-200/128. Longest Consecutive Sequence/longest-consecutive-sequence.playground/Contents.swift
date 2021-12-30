import Foundation

// 128. Longest Consecutive Sequence
// https://leetcode.com/problems/longest-consecutive-sequence/

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        let sorted = Set(nums).sorted()
        var long = 0, count = 1, i = 0
        
        while i < sorted.count {
            if i - 1 >= 0, sorted[i-1] == sorted[i] - 1 {
                count += 1
            } else {
                long = max(count, long)
                count = 1
            }
            i += 1
        }
        long = max(count, long)
        return long
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.longestConsecutive([100,4,200,1,3,2])
        XCTAssertEqual(value, 4)
    }
    
    func test1() {
        let value = solution.longestConsecutive([0,3,7,2,5,8,4,6,0,1])
        XCTAssertEqual(value, 9)
    }
}

Tests.defaultTestSuite.run()
