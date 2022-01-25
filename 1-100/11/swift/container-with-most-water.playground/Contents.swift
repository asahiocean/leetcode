import Foundation

// 11. Container With Most Water
// https://leetcode.com/problems/container-with-most-water/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        let len = height.count
        guard len > 2 else { return min(height[0], height[1]) }
        
        var area = 0
        var lhs = 0, rhs = len - 1
        
        while lhs < rhs {
            let lots = min(height[lhs], height[rhs]) * (rhs - lhs)
            area = max(area, lots)
            height[lhs] < height[rhs] ? (lhs += 1) : (rhs -= 1)
        }
        return area
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7].
    // In this case, the max area of water (blue section) the container can contain is 49.
    func test0() {
        let value = solution.maxArea([1,8,6,2,5,4,8,3,7])
        XCTAssertEqual(value, 49)
    }
    
    func test1() {
        let value = solution.maxArea([1,1])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
