import Foundation

// 1539. Kth Missing Positive Number
// https://leetcode.com/problems/kth-missing-positive-number/

class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        let set = Set(arr)
        var idx = 1, val = 0
        while true {
            if !set.contains(idx) {
                val += 1
                if val == k { return idx }
            }
            idx += 1
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // The missing positive integers are [1,5,6,8,9,10,12,13,...].
    // The 5th missing positive integer is 9.
    func test0() {
        let value = solution.findKthPositive([2,3,4,7,11], 5)
        XCTAssertEqual(value, 9)
    }
    
    // The missing positive integers are [5,6,7,...].
    // The 2nd missing positive integer is 6.
    func test1() {
        let value = solution.findKthPositive([1,2,3,4], 2)
        XCTAssertEqual(value, 6)
    }
}

Tests.defaultTestSuite.run()
