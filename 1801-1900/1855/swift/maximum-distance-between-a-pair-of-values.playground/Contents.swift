import Foundation

// 1855. Maximum Distance Between a Pair of Values
// https://leetcode.com/problems/maximum-distance-between-a-pair-of-values/

class Solution {
    func maxDistance(_ n1: [Int], _ n2: [Int]) -> Int {
        let ln1 = n1.count, ln2 = n2.count
        var idx = 0, res = 0
        for j in 0..<ln2 {
            while idx < ln1 && n1[idx] > n2[j] {
                idx += 1
            }
            if idx < ln1 { res = max(res, j - idx) }
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // The valid pairs are (0,0), (2,2), (2,3), (2,4), (3,3), (3,4), and (4,4).
    // The maximum distance is 2 with pair (2,4).
    func test0() {
        let value = solution.maxDistance([55,30,5,4,2], [100,20,10,10,5])
        XCTAssertEqual(value, 2)
    }
    
    // The valid pairs are (0,0), (0,1), and (1,1).
    // The maximum distance is 1 with pair (0,1).
    func test1() {
        let value = solution.maxDistance([2,2,2], [10,10,1])
        XCTAssertEqual(value, 1)
    }
    
    // The valid pairs are (2,2), (2,3), (2,4), (3,3), and (3,4).
    // The maximum distance is 2 with pair (2,4).
    func test2() {
        let value = solution.maxDistance([30,29,19,5], [25,25,25,25,25])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
