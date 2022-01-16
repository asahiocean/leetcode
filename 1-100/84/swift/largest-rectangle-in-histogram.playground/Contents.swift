import Foundation

// 84. Largest Rectangle in Histogram
// https://leetcode.com/problems/largest-rectangle-in-histogram/

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        var stack: [Int] = []
        let len = heights.count
        var value = 0
        
        for i in 0..<len {
            while let height = stack.last, heights[height] >= heights[i] {
                stack.removeLast()
                let width = (stack.last ?? -1)
                value = max(value, heights[height] * (i - width - 1))
            }
            stack.append(i)
        }
        
        while !stack.isEmpty {
            let height = stack.removeLast()
            let width = stack.last ?? -1
            value = max(value, heights[height] * (len - width - 1))
        }
        
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The above is a histogram where width of each bar is 1.
    // The largest rectangle is shown in the red area, which has an area = 10 units.
    func test0() {
        let value = solution.largestRectangleArea([2,1,5,6,2,3])
        XCTAssertEqual(value, 10)
    }
    
    func test1() {
        let value = solution.largestRectangleArea([2,4])
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()
