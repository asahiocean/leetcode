import Foundation

// 1009. Complement of Base 10 Integer
// https://leetcode.com/problems/complement-of-base-10-integer/

class Solution {
    func bitwiseComplement(_ n: Int) -> Int {
        var s: Int = 1
        while s < n { s = (s << 1) | 1 }
        return s - n
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// 5 is "101" in binary, with complement "010" in binary, which is 2 in base-10.
    func test1() {
        let value = solution.bitwiseComplement(5)
        XCTAssertEqual(value, 2)
    }
    
    /// 7 is "111" in binary, with complement "000" in binary, which is 0 in base-10.
    func test2() {
        let value = solution.bitwiseComplement(7)
        XCTAssertEqual(value, 0)
    }
    
    /// 10 is "1010" in binary, with complement "0101" in binary, which is 5 in base-10.
    func test3() {
        let value = solution.bitwiseComplement(10)
        XCTAssertEqual(value, 5)
    }
}

Tests.defaultTestSuite.run()
