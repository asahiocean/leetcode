import Foundation

// 991. Broken Calculator
// https://leetcode.com/problems/broken-calculator/

class Solution {
    func brokenCalc(_ s: Int, _ t: Int) -> Int {
        var cnt = 0
        var trg = t
        while trg > s {
            trg = trg % 2 == 0 ? trg / 2 : trg + 1
            cnt += 1
        }
        return cnt + s - trg
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // Use double operation and then decrement operation {2 -> 4 -> 3}.
    func test0() {
        let value = solution.brokenCalc(2, 3)
        XCTAssertEqual(value, 2)
    }
    
    // Use decrement and then double {5 -> 4 -> 8}.
    func test1() {
        let value = solution.brokenCalc(5, 8)
        XCTAssertEqual(value, 2)
    }
    
    // Use double, decrement and double {3 -> 6 -> 5 -> 10}.
    func test2() {
        let value = solution.brokenCalc(3, 10)
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
