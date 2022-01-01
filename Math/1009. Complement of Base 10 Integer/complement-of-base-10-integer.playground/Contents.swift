import Foundation

// 1009. Complement of Base 10 Integer
// https://leetcode.com/problems/complement-of-base-10-integer/

class Solution {
    func bitwiseComplement(_ n: Int) -> Int {
        var s = 1
        while s < n { s = (s << 1) | 1 }
        return s - n
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let value = solution.bitwiseComplement(5)
        XCTAssertEqual(value, 2)
    }
    func test2() {
        let value = solution.bitwiseComplement(7)
        XCTAssertEqual(value, 0)
    }
    func test3() {
        let value = solution.bitwiseComplement(10)
        XCTAssertEqual(value, 5)
    }
}

Tests.defaultTestSuite.run()
