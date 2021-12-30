import Foundation

// 1137. N-th Tribonacci Number
// https://leetcode.com/problems/n-th-tribonacci-number/

class Solution {
    func tribonacci(_ n: Int) -> Int {
        if (n == 0 || n == 1 || n == 2) { return n == 0 ? 0 : 1 }
        var (val1,val2,val3) = (0,1,1)
        for _ in 1...n { (val1,val2,val3) = (val2,val3,val1+val2+val3) }
        return val1
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// T_3 = 0 + 1 + 1 = 2
    /// T_4 = 1 + 1 + 2 = 4
    func test0() {
        let value = solution.tribonacci(4)
        XCTAssertEqual(value, 4)
    }
    
    func test1() {
        let value = solution.tribonacci(25)
        XCTAssertEqual(value, 1389537)
    }
}

Tests.defaultTestSuite.run()
