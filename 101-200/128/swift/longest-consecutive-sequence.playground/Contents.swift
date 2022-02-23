import Foundation

// 128. Longest Consecutive Sequence
// https://leetcode.com/problems/longest-consecutive-sequence/

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        let setSort = Set(nums).sorted()
        var longest = 0, count = 1, num = 0
        
        while num < setSort.count {
            if num - 1 >= 0, setSort[num - 1] == setSort[num] - 1 {
                count += 1
            } else {
                longest = max(count, longest)
                count = 1
            }
            num += 1
        }
        return max(count, longest)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
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
