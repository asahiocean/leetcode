import Foundation

// 11. Container With Most Water
// https://leetcode.com/problems/container-with-most-water/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 2 else { return min(height[0], height[1]) }
        
        var area = 0
        var left = 0, right = height.count - 1
        
        while left < right {
            let lots = min(height[left],height[right]) * (right - left)
            
            area = max(area, lots)
            
            height[left] < height[right] ? (left += 1) : (right -= 1)
        }
        return area
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.maxArea([1,8,6,2,5,4,8,3,7])
        XCTAssertEqual(value, 49)
    }
    
    func test1() {
        let value = solution.maxArea([1,1])
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.maxArea([4,3,2,1,4])
        XCTAssertEqual(value, 16)
    }
    
    func test3() {
        let value = solution.maxArea([1,2,1])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
