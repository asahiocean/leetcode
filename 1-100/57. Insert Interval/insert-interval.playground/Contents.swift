import Foundation

// 57. Insert Interval
// https://leetcode.com/problems/insert-interval/

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard !intervals.isEmpty else { return [newInterval] }
        guard !newInterval.isEmpty else { return intervals }
        
        var idx = 0, new = newInterval, result: [[Int]] = []
        let len = intervals.count
        
        while idx < len, intervals[idx][1] < new[0] {
            result.append(intervals[idx])
            idx += 1
        }
        
        while idx < len, intervals[idx][0] <= new[1] {
            new[0] = min(intervals[idx][0], new[0])
            new[1] = max(intervals[idx][1], new[1])
            idx += 1
        }
        
        result.append(new)
        
        for i in idx..<len { result.append(intervals[i]) }
        
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.insert([[1,3],[6,9]], [2,5])
        XCTAssertEqual(value, [[1,5],[6,9]])
    }
    
    // Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
    func test1() {
        let value = solution.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])
        XCTAssertEqual(value, [[1,2],[3,10],[12,16]])
    }
}

Tests.defaultTestSuite.run()
