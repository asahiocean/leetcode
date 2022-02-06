import Foundation

// 174. Dungeon Game
// https://leetcode.com/problems/dungeon-game/

class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let M = dungeon.count, N = dungeon[0].count
        
        guard M > 0, N > 0 else { return 1 }
        
        var minHP = [[Int]](repeating: [Int](repeating: 1, count: N), count: M)
        
        for m in (0..<M).reversed() {
            for n in (0..<N).reversed() {
                switch true {
                case M - 1 == m && N - 1 == n: minHP[m][n] = max(1, 1 - dungeon[M-1][N-1])
                case M - 1 == m: minHP[m][n] = max(1, minHP[m][n+1] - dungeon[m][n])
                case N - 1 == n: minHP[m][n] = max(1, minHP[m+1][n] - dungeon[m][n])
                default: minHP[m][n] = max(1, min(minHP[m+1][n], minHP[m][n+1]) - dungeon[m][n])
                }
            }
        }
        return minHP[0][0]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The initial health of the knight must be at least 7 if he follows the optimal path: RIGHT-> RIGHT -> DOWN -> DOWN.
    func test0() {
        let value = solution.calculateMinimumHP([[-2,-3,3],[-5,-10,1],[10,30,-5]])
        XCTAssertEqual(value, 7)
    }
    
    func test1() {
        let value = solution.calculateMinimumHP([[0]])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
