import Foundation

// 209. Minimum Size Subarray Sum
// https://leetcode.com/problems/minimum-size-subarray-sum/

class Solution {
    func minSubArrayLen(_ t: Int, _ n: [Int]) -> Int {
        var size = Int.max, start = 0, sum = 0
        for (a,b) in n.enumerated() {
            sum += b
            while sum >= t, start <= a {
                size = min(size, a - start + 1)
                sum -= n[start]
                start += 1
            }
        }
        return size == .max ? 0 : size
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.minSubArrayLen(7, [2,3,1,2,4,3])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.minSubArrayLen(4, [1,4,4])
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.minSubArrayLen(11, [1,1,1,1,1,1,1,1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
