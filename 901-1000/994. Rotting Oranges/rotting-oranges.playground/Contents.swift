import Foundation

// 994. Rotting Oranges
// https://leetcode.com/problems/rotting-oranges/

class Solution {
    
    private typealias Direction = (dx: Int, dy: Int)
    private let dirs: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        let rows = grid.count
        let cols = grid[0].count
        
        var queue: [Int] = [Int]()
        var oranges: Set = Set<Int>()
        
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 2 {
                    queue.append(i << 8 | j)
                } else if grid[i][j] == 1 {
                    oranges.insert(i << 8 | j)
                    
                }
            }
        }
        
        func check(_ x: Int, _ y: Int) -> Bool {
            x < rows && x >= 0 && y < cols && y >= 0
        }
        
        var neededTime = 0
        while !queue.isEmpty {
            var nextLevel: [Int] = [Int]()
            for p in queue {
                let x = p >> 8
                let y = p & 0xff
                for dir in dirs {
                    let nextX = x + dir.dx
                    let nextY = y + dir.dy
                    if check(nextX, nextY)  {
                        let nextP = (nextX << 8 | nextY)
                        if oranges.contains(nextP) {
                            oranges.remove(nextP)
                            nextLevel.append(nextP)
                        }
                    }
                }
            }
            queue = nextLevel
            if !queue.isEmpty { neededTime += 1 }
        }
        return oranges.isEmpty ? neededTime : -1
    }
}
