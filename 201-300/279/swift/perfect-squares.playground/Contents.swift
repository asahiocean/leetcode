import Foundation

// 279. Perfect Squares
// https://leetcode.com/problems/perfect-squares/

class Solution {
    func numSquares(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        
        var leasts = [Int](repeating: Int.max, count: n + 1)
        leasts[0] = 0
        
        for i in 1...n {
            for j in 1...i {
                if (j * j) > i { break }
                leasts[i] = min(leasts[i], leasts[i - (j * j)] + 1)
            }
        }
        
        return leasts[n]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 12 = 4 + 4 + 4.
    func test0() {
        let value = solution.numSquares(12)
        XCTAssertEqual(value, 3)
    }
    
    // 13 = 4 + 9.
    func test1() {
        let value = solution.numSquares(13)
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
