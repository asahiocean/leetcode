import Foundation

// 1359. Count All Valid Pickup and Delivery Options
// https://leetcode.com/problems/count-all-valid-pickup-and-delivery-options/

class Solution {
    private let mod = 1_000_000_007
    func countOrders(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var val = 1
        for i in 2...n {
            let count = (i - 1) << 1
            val = val * (count + 1) * (count + 2) >> 1 % mod
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Unique order (P1, D1), Delivery 1 always is after of Pickup 1.
    func test0() {
        let value = solution.countOrders(1)
        XCTAssertEqual(value, 1)
    }
    
    // All possible orders:
    // (P1,P2,D1,D2), (P1,P2,D2,D1), (P1,D1,P2,D2), (P2,P1,D1,D2), (P2,P1,D2,D1) and (P2,D2,P1,D1).
    // This is an invalid order (P1,D2,P2,D1) because Pickup 2 is after of Delivery 2.
    func test1() {
        let value = solution.countOrders(2)
        XCTAssertEqual(value, 6)
    }
}

Tests.defaultTestSuite.run()
