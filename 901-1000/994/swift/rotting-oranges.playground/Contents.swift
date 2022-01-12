import Foundation

// 994. Rotting Oranges
// https://leetcode.com/problems/rotting-oranges/

class Solution {
    
    private typealias Direction = (dx: Int, dy: Int)
    private let dirs: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        let rows = grid.count, cols = grid[0].count
        
        var queue: [Int] = [], oranges: Set<Int> = []
        
        for r in 0..<rows {
            for c in 0..<cols {
                switch grid[r][c] {
                case 1: oranges.insert(r << 8 | c)
                case 2: queue.append(r << 8 | c)
                default: break
                }
            }
        }
        
        func check(_ x: Int, _ y: Int) -> Bool {
            return x < rows && x >= 0 && y < cols && y >= 0
        }
        
        var neededTime = 0
        while !queue.isEmpty {
            
            var nextlvl: [Int] = []
            
            for p in queue {
                
                let x = p >> 8
                let y = p & 0xff
                
                for d in dirs {
                    let nextX = x + d.dx
                    let nextY = y + d.dy
                    if check(nextX, nextY)  {
                        let nextP = (nextX << 8 | nextY)
                        if oranges.contains(nextP) {
                            oranges.remove(nextP)
                            nextlvl.append(nextP)
                        }
                    }
                }
            }
            queue = nextlvl
            if !queue.isEmpty { neededTime += 1 }
        }
        return oranges.isEmpty ? neededTime : -1
    }
}
