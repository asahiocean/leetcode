import Foundation

// 1608. Special Array With X Elements Greater Than or Equal X
// https://leetcode.com/problems/special-array-with-x-elements-greater-than-or-equal-x/

class Solution {
    func specialArray(_ n: [Int]) -> Int {
        var val = -1, x = 1
        for _ in 0..<n.count {
            var cnt = 0
            for j in 0..<n.count where n[j] >= x {
                cnt += 1
            }
            x == cnt ? (val = x) : (x += 1)
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // There are 2 values (3 and 5) that are greater than or equal to 2.
    func test0() {
        let value = solution.specialArray([3,5])
        XCTAssertEqual(value, 2)
    }
    
    // No numbers fit the criteria for x.
    // If x = 0, there should be 0 numbers >= x, but there are 2.
    // If x = 1, there should be 1 number >= x, but there are 0.
    // If x = 2, there should be 2 numbers >= x, but there are 0.
    // x cannot be greater since there are only 2 numbers in nums.
    func test1() {
        let value = solution.specialArray([0,0])
        XCTAssertEqual(value, -1)
    }
    
    // There are 3 values that are greater than or equal to 3.
    func test2() {
        let value = solution.specialArray([0,4,3,0,4])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
