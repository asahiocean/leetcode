import Foundation

// 1094. Car Pooling
// https://leetcode.com/problems/car-pooling/

class Solution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var route = [Int](repeating: 0, count: 1001)
        for t in trips {
            route[t[1]] += t[0]
            route[t[2]] -= t[0]
        }
        var numPassengers = 0
        for el in route {
            numPassengers += el
            if numPassengers > capacity {
                return false
            }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.016 (0.018) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.carPooling([[2,1,5],[3,3,7]], 4)
        XCTAssertEqual(value, false)
    }
    
    func test1() {
        let value = solution.carPooling([[2,1,5],[3,3,7]], 5)
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()
