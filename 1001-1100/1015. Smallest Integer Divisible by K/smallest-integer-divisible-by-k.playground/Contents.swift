import Foundation

// 1015. Smallest Integer Divisible by K
// https://leetcode.com/problems/smallest-integer-divisible-by-k/

class Solution {
    func smallestRepunitDivByK(_ k: Int) -> Int {
        guard !(k % 2 == 0 || k % 5 == 0) else { return -1 }
        guard k != 1 else { return 1 }
        var length = 1
        var temp = 1
        while temp != 0 {
            temp = (temp * 10 + 1) % k
            length += 1
        }
        return length
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.smallestRepunitDivByK(1)
        XCTAssertEqual(value, 1)
    }
    func test1() {
        let value = solution.smallestRepunitDivByK(2)
        XCTAssertEqual(value, -1)
    }
    func test3() {
        let value = solution.smallestRepunitDivByK(3)
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
