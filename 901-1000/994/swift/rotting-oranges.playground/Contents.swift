import Foundation

// 994. Rotting Oranges
// https://leetcode.com/problems/rotting-oranges/

class Solution {
    func orangesRotting(_ g: [[Int]]) -> Int {
        var queue: [Int] = [], orng: Set<Int> = []
        for r in 0..<g.count {
            for c in 0..<g[0].count {
                let val = r << 8 | c
                switch g[r][c] {
                case 1: orng.insert(val)
                case 2: queue.append(val)
                default: break
                }
            }
        }
        func check(_ x: Int, _ y: Int) -> Bool {
            return x < g.count && x >= 0 && y < g[0].count && y >= 0
        }
        var time = 0
        while !queue.isEmpty {
            var lvl: [Int] = []
            for p in queue {
                let x = p >> 8, y = p & 0xff
                for (dx,dy) in [(0,1),(0,-1),(1,0),(-1,0)] {
                    let next = (x: x + dx, y: y + dy)
                    if check(next.x, next.y)  {
                        let nextP = (next.x << 8 | next.y)
                        if orng.contains(nextP) {
                            orng.remove(nextP)
                            lvl.append(nextP)
                        }
                    }
                }
            }
            queue = lvl
            if !queue.isEmpty { time += 1 }
        }
        return orng.isEmpty ? time : -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.024 (0.026) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.orangesRotting([[2,1,1],[1,1,0],[0,1,1]])
        XCTAssertEqual(value, 4)
    }
    
    // The orange in the bottom left corner (row 2, column 0) is never rotten,
    // because rotting only happens 4-directionally.
    func test1() {
        let value = solution.orangesRotting([[2,1,1],[0,1,1],[1,0,1]])
        XCTAssertEqual(value, -1)
    }
    
    // Since there are already no fresh oranges at minute 0, the answer is just 0.
    func test2() {
        let value = solution.orangesRotting([[0,2]])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
