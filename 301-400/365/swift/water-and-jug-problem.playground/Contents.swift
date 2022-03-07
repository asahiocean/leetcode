import Foundation

// 365. Water and Jug Problem
// https://leetcode.com/problems/water-and-jug-problem/

class Solution {
    func canMeasureWater(_ jug1Capacity: Int, _ jug2Capacity: Int, _ targetCapacity: Int) -> Bool {
        let targ = targetCapacity, jug1 = jug1Capacity, jug2 = jug2Capacity
        if targ == 0 { return false }
        guard jug1 + jug2 >= targ else { return false }
        func gcd(_ a: Int, _ b: Int) -> Int { return b == 0 ? a : gcd(b, a % b) }
        let div = gcd(jug1, jug2)
        guard div != 0 else { return false }
        return targ % div == 0
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The famous Die Hard example
    func test0() {
        let value = solution.canMeasureWater(3, 5, 4)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.canMeasureWater(2, 6, 5)
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.canMeasureWater(1, 2, 3)
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()
