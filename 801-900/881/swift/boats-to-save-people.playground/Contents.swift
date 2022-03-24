import Foundation

// 881. Boats to Save People
// https://leetcode.com/problems/boats-to-save-people/

class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let sort = people.sorted()
        var lhs = 0, rhs = people.count - 1
        var num = 0
        while lhs <= rhs {
            num += 1
            if sort[lhs] + sort[rhs] <= limit {
                lhs += 1
            }
            rhs -= 1
        }
        return num
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 1 boat (1, 2)
    func test0() {
        let value = solution.numRescueBoats([1,2], 3)
        XCTAssertEqual(value, 1)
    }
    
    // 3 boats (1, 2), (2) and (3)
    func test1() {
        let value = solution.numRescueBoats([3,2,2,1], 3)
        XCTAssertEqual(value, 3)
    }
    
    // 4 boats (3), (3), (4), (5)
    func test2() {
        let value = solution.numRescueBoats([3,5,3,4], 5)
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()
