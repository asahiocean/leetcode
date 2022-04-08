import Foundation

// 1346. Check If N and Its Double Exist
// https://leetcode.com/problems/check-if-n-and-its-double-exist/

class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        if arr.isEmpty { return false }
        var set: Set<Int> = []
        for n in arr {
            if set.contains(n * 2) || n.isMultiple(of: 2) && set.contains(n / 2) {
                return true
            }
            set.insert(n)
        }
        return false
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // N = 10 is the double of M = 5,that is, 10 = 2 * 5.
    func test0() {
        let value = solution.checkIfExist([10,2,5,3])
        XCTAssertEqual(value, true)
    }
    
    // N = 14 is the double of M = 7,that is, 14 = 2 * 7.
    func test1() {
        let value = solution.checkIfExist([7,1,14,11])
        XCTAssertEqual(value, true)
    }
    
    // In this case does not exist N and M, such that N = 2 * M.
    func test2() {
        let value = solution.checkIfExist([3,1,7,11])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
