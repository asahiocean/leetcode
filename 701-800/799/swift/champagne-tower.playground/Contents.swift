import Foundation

// 799. Champagne Tower
// https://leetcode.com/problems/champagne-tower/

class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var stack = [[Double]](repeating: [Double](repeating: 0, count: 102), count: 102)
        stack[0][0] = Double(poured)
        for r in 0...query_row {
            for c in 0...r {
                let val = (stack[r][c] - 1) / 2
                if val > 0 {
                    stack[r+1][c] += val
                    stack[r+1][c+1] = val
                }
            }
        }
        return min(1.0, stack[query_row][query_glass])
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.067 (0.069) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // We poured 1 cup of champange to the top glass of the tower (which is indexed as (0, 0)).
    // There will be no excess liquid so all the glasses under the top glass will remain empty.
    func test0() {
        let value = solution.champagneTower(1, 1, 1)
        XCTAssertEqual(value, 0.00000)
    }
    
    // We poured 2 cups of champange to the top glass of the tower (which is indexed as (0, 0)).
    // There is one cup of excess liquid. The glass indexed as (1, 0) and the glass indexed as
    // (1, 1) will share the excess liquid equally, and each will get half cup of champange.
    func test1() {
        let value = solution.champagneTower(2, 1, 1)
        XCTAssertEqual(value, 0.50000)
    }
    
    func test2() {
        let value = solution.champagneTower(100000009, 33, 17)
        XCTAssertEqual(value, 1.00000)
    }
}

Tests.defaultTestSuite.run()
