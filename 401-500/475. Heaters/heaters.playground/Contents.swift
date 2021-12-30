import Foundation

// 475. Heaters
// https://leetcode.com/problems/heaters/

class Solution {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        var index = 0
        var radius = 0
        
        let sorted = heaters.sorted()
        
        for h in houses.sorted() {
            while index < sorted.count - 1 && (h * 2) >= sorted[index] + sorted[index+1] {
                index += 1
            }
            radius = max(radius, abs(h - sorted[index]))
        }
        return radius
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findRadius([1,2,3], [2])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.findRadius([1,2,3,4], [1,4])
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.findRadius([1,5], [2])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
