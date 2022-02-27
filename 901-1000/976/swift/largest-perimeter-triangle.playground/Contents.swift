import Foundation

// 976. Largest Perimeter Triangle
// https://leetcode.com/problems/largest-perimeter-triangle/

class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let sort = nums.sorted(by: >)
        for i in 0...sort.count - 3 {
            let val = (a: sort[i], bc: (sort[i+1] + sort[i+2]))
            if val.a < val.bc { return val.a + val.bc }
        }
        return 0
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.largestPerimeter([2,1,2])
        XCTAssertEqual(value, 5)
    }
    
    func test1() {
        let value = solution.largestPerimeter([1,2,1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
