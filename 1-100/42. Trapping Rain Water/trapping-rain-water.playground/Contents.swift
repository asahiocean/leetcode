import Foundation

// 42. Trapping Rain Water
// https://leetcode.com/problems/trapping-rain-water/

class Solution {
    func trap(_ height: [Int]) -> Int {
        
        var stack: [Int] = [], result = 0
        
        for i in height.indices {
            let hidx = height[i]
            
            while !(stack.isEmpty), let last = stack.last, hidx > height[last] {
                let top = stack.removeLast()
                if !(stack.isEmpty), let last = stack.last {
                    let diff = min(hidx, height[last]) - height[top]
                    result += (i - last - 1) * diff
                } else { break }
            }
            stack.append(i)
        }
        
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.024 (0.026) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.trap([0,1,0,2,1,0,1,3,2,1,2,1])
        XCTAssertEqual(value, 6)
    }
    
    func test1() {
        let value = solution.trap([4,2,0,3,2,5])
        XCTAssertEqual(value, 9)
    }
}

Tests.defaultTestSuite.run()
