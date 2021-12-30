import Foundation

// 509. Fibonacci Number
// https://leetcode.com/problems/fibonacci-number/

class Solution {
    func fib(_ n: Int) -> Int {
        guard n >= 2 else { return n }
        var (fib0,fib1) = (0,1)
        for _ in 2...n { (fib0,fib1) = (fib1, fib0 + fib1) }
        return fib1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// F(2) = F(1) + F(0) = 1 + 0 = 1.
    func test0() {
        let value = solution.fib(2)
        XCTAssertEqual(value, 1)
    }
    
    /// F(3) = F(2) + F(1) = 1 + 1 = 2.
    func test1() {
        let value = solution.fib(3)
        XCTAssertEqual(value, 2)
    }
    
    /// F(4) = F(3) + F(2) = 2 + 1 = 3.
    func test2() {
        let value = solution.fib(4)
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
