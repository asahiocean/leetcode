import Foundation

// 11. Container With Most Water
// https://leetcode.com/problems/container-with-most-water/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 2 else { return min(height[0], height[1]) }
        
        var area = 0, l = 0, r = height.count - 1
        while l < r {
            let lots = min(height[l],height[r]) * (r - l)
            area = max(area, lots)
            if height[l] < height[r] { l += 1 } else { r -= 1 }
        }
        return area
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func test0() {
        XCTAssertEqual(s.maxArea([1,8,6,2,5,4,8,3,7]), 49)
    }
    
    func test1() {
        XCTAssertEqual(s.maxArea([1,1]), 1)
    }
    
    func test2() {
        XCTAssertEqual(s.maxArea([4,3,2,1,4]), 16)
    }
    
    func test3() {
        XCTAssertEqual(s.maxArea([1,2,1]), 2)
    }
}

Tests.defaultTestSuite.run()
