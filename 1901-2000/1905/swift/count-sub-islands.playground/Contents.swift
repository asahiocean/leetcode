import Foundation

// 1905. Count Sub Islands
// https://leetcode.com/problems/count-sub-islands/

class Solution {
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        guard !(grid1.isEmpty), !(grid2.isEmpty) else { return 0 }
        
        let row1 = grid1.count, col1 = grid1[0].count
        
        var result = 0
        var idisland = 2
        var g1copy = grid1
        
        typealias Direction = (r: Int, c: Int)
        let dirs: [Direction] = [(-1,0),(1,0),(0,-1),(0,1)]
        
        func validRC(r: Int, c: Int) -> Bool {
            return (r >= 0 && r < row1) && (c >= 0 && c < col1)
        }
        
        func dfs1(_ r: Int, _ c: Int) {
            g1copy[r][c] = idisland
            for (dr,dc) in dirs {
                let newR = r + dr, newC = c + dc
                guard validRC(r: newR, c: newC) else { continue }
                guard g1copy[newR][newC] == 1 else { continue }
                dfs1(newR, newC)
            }
        }
        
        for r in 0..<row1 {
            for c in 0..<col1 where g1copy[r][c] == 1 {
                idisland += 1
                dfs1(r, c)
            }
        }
        
        var g2vst = [[Bool]](repeating: [Bool](repeating: false, count: col1), count: row1)
        
        func dfs2(_ r: Int, _ c: Int, _ posns: inout [Int])  {
            g2vst[r][c] = true
            posns.append(r << 16 | c)
            for (dr,dc) in dirs {
                let newR = r + dr, newC = c + dc
                guard validRC(r: newR, c: newC) else { continue }
                guard grid2[newR][newC] == 1 && !g2vst[newR][newC] else { continue }
                dfs2(newR, newC, &posns)
            }
        }
        
        func valid(_ pos: [Int]) -> Bool {
            let targ = g1copy[pos[0] >> 16][pos[0] & 0xffff]
            guard targ >= 2 else { return false }
            for p in pos where g1copy[p >> 16][p & 0xffff] != targ {
                return false
            }
            return true
        }
        
        for r in 0..<row1 {
            for c in 0..<col1 where grid2[r][c] == 1 && !g2vst[r][c] {
                var posns: [Int] = [] // islands
                dfs2(r, c, &posns)
                if valid(posns) { result += 1 }
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.032 (0.034) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // In the picture above, the grid on the left is grid1 and the grid on the right is grid2.
    // The 1s colored red in grid2 are those considered to be part of a sub-island.
    // There are three sub-islands.
    func test0() {
        let grid1 = [[1,1,1,0,0],[0,1,1,1,1],[0,0,0,0,0],[1,0,0,0,0],[1,1,0,1,1]]
        let grid2 = [[1,1,1,0,0],[0,0,1,1,1],[0,1,0,0,0],[1,0,1,1,0],[0,1,0,1,0]]
        let value = solution.countSubIslands(grid1, grid2)
        XCTAssertEqual(value, 3)
    }
    
    // In the picture above, the grid on the left is grid1 and the grid on the right is grid2.
    // The 1s colored red in grid2 are those considered to be part of a sub-island.
    // There are two sub-islands.
    func test1() {
        let grid1 = [[1,0,1,0,1],[1,1,1,1,1],[0,0,0,0,0],[1,1,1,1,1],[1,0,1,0,1]]
        let grid2 = [[0,0,0,0,0],[1,1,1,1,1],[0,1,0,1,0],[0,1,0,1,0],[1,0,0,0,1]]
        let value = solution.countSubIslands(grid1, grid2)
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
