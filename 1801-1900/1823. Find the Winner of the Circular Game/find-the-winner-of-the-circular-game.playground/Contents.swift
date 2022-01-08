import Foundation

// 1823. Find the Winner of the Circular Game
// https://leetcode.com/problems/find-the-winner-of-the-circular-game/

class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        var value = 0
        for i in 1...n { value = (value + k) % i }
        return value + 1
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Here are the steps of the game:
    /// 1) Start at friend 1.
    /// 2) Count 2 friends clockwise, which are friends 1 and 2.
    /// 3) Friend 2 leaves the circle. Next start is friend 3.
    /// 4) Count 2 friends clockwise, which are friends 3 and 4.
    /// 5) Friend 4 leaves the circle. Next start is friend 5.
    /// 6) Count 2 friends clockwise, which are friends 5 and 1.
    /// 7) Friend 1 leaves the circle. Next start is friend 3.
    /// 8) Count 2 friends clockwise, which are friends 3 and 5.
    /// 9) Friend 5 leaves the circle. Only friend 3 is left, so they are the winner.
    func test0() {
        let value = solution.findTheWinner(5, 2)
        XCTAssertEqual(value, 3)
    }
    
    /// The friends leave in this order: 5, 4, 6, 2, 3. The winner is friend 1.
    func test1() {
        let value = solution.findTheWinner(6, 5)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
