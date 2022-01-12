import Foundation

// 542. 01 Matrix
// https://leetcode.com/problems/01-matrix/

class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let rows = mat.count, cols = mat[0].count
        var mat = mat
        var queue: [(Int, Int)] = []
        
        for r in 0..<rows {
            for c in 0..<cols {
                if mat[r][c] == 0 {
                    queue.append((r, c))
                } else {
                    mat[r][c] = -1
                }
            }
        }
        
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var dist = 1
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                
                let (f1,f2) = queue.removeFirst()
                
                for d in directions {
                    let x = f1 + d.0
                    let y = f2 + d.1
                    if x < 0 || x >= rows || y < 0 || y >= cols || mat[x][y] != -1 {
                        continue
                    }
                    mat[x][y] = dist
                    queue.append((x, y))
                }
            }
            dist += 1
        }
        return mat
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.026 (0.028) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.updateMatrix([[0,0,0],[0,1,0],[0,0,0]])
        XCTAssertEqual(value, [[0,0,0],[0,1,0],[0,0,0]])
    }
    
    func test1() {
        let value = solution.updateMatrix([[0,0,0],[0,1,0],[1,1,1]])
        XCTAssertEqual(value, [[0,0,0],[0,1,0],[1,2,1]])
    }
}

Tests.defaultTestSuite.run()
