import Foundation

// 1926. Nearest Exit from Entrance in Maze
// https://leetcode.com/problems/nearest-exit-from-entrance-in-maze/

class Solution {
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        let m = maze.count, n = maze[0].count
        
        typealias Position = (x: Int, y: Int)
        func valid(_ p: Position) -> Bool {
            return (p.x == 0 || p.x == m - 1) || (p.y == 0 || p.y == n - 1)
        }
        
        var queue = [(entrance[0], entrance[1])]
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        visited[entrance[0]][entrance[1]] = true
        
        var steps = 0
        while !queue.isEmpty {
            steps += 1
            var newQueue: [Position] = []
            for (x,y) in queue {
                for (dx,dy) in [(0,1),(0,-1),(1,0),(-1,0)] {
                    let nxt = (x: x + dx, y: y + dy)
                    guard (nxt.x >= 0 && nxt.x < m) &&
                          (nxt.y >= 0 && nxt.y < n) &&
                          maze[nxt.x][nxt.y] == "." && !visited[nxt.x][nxt.y]
                    else { continue }
                    visited[nxt.x][nxt.y] = true
                    let np = (nxt.x, nxt.y)
                    guard !valid(np) else { return steps }
                    newQueue.append(np)
                }
            }
            queue = newQueue
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.016 (0.018) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    /*
        There are 3 exits in this maze at [1,0], [0,2], and [2,3].
        Initially, you are at the entrance cell [1,2].
        - You can reach [1,0] by moving 2 steps left.
        - You can reach [0,2] by moving 1 step up.
        It is impossible to reach [2,3] from the entrance.
        Thus, the nearest exit is [0,2], which is 1 step away.
    */
    func test0() {
        let value = solution.nearestExit([["+","+",".","+"],
                                          [".",".",".","+"],
                                          ["+","+","+","."]], [1,2])
        XCTAssertEqual(value, 1)
    }
    
    /*
        There is 1 exit in this maze at [1,2].
        [1,0] does not count as an exit since it is the entrance cell.
        Initially, you are at the entrance cell [1,0].
        - You can reach [1,2] by moving 2 steps right.
        Thus, the nearest exit is [1,2], which is 2 steps away.
    */
    func test1() {
        let value = solution.nearestExit([["+","+","+"],
                                          [".",".","."],
                                          ["+","+","+"]], [1,0])
        XCTAssertEqual(value, 2)
    }
    
    // There are no exits in this maze.
    func test2() {
        let value = solution.nearestExit([[".","+"]], [0,0])
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
