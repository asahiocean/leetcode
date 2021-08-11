import Foundation

// 50. Pow(x, n)
// https://leetcode.com/problems/powx-n/

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x, n = n, res = 1.0
        
        if n < 0 { x = 1.0/x ; n = -n }
        
        while n > 0 {
            if n % 2 != 0 { res *= x }
            x *= x
            n /= 2
        }
        return res
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.myPow(2.00000, 10)
        XCTAssertEqual(res, 1024)
    }
    func test1() {
        let res = s.myPow(2.10000, 3)
        XCTAssertEqual(res, 9.261000000000001)
    }
    func test2() {
        let res = s.myPow(2.00000, -2)
        XCTAssertEqual(res, 0.25)
    }
}

Tests.defaultTestSuite.run()
