import Foundation

// 476. Number Complement
// https://leetcode.com/problems/number-complement/

class Solution {
    func findComplement(_ num: Int) -> Int {
        var n = 1
        while n <= num { n <<= 1 }
        return (n - 1) ^ num
    }
}

// MARK: - Test Cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findComplement(5)
        XCTAssertEqual(value, 2)
    }
    func test1() {
        let value = solution.findComplement(1)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
