import Foundation

// 435. Non-overlapping Intervals
// https://leetcode.com/problems/non-overlapping-intervals/

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        
        let sorted = intervals.sorted{$0[0] < $1[0]} // left border sorting
        
        var end = sorted[0][1]
        var count = 0
        
        for i in 1..<intervals.count {
            let arr = sorted[i]
            // If after sorting several arrays are on the same left boundary.
            // then only the one with the smallest right boundary should be left
            if arr[0] < end {
                end = min(end, arr[1])
                count += 1
            } else {
                end = arr[1]
            }
        }
        return count
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.eraseOverlapIntervals([[1,2],[1,2],[1,2]])
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.eraseOverlapIntervals([[1,2],[2,3]])
        XCTAssertEqual(value, 0)
    }
    
}

Tests.defaultTestSuite.run()
