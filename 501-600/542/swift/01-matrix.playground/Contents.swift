import Foundation

// 542. 01 Matrix
// https://leetcode.com/problems/01-matrix/

class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        let rows = mat.count, cols = mat[0].count
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
        
        typealias Coords = (x: Int, y: Int)
        var dist = 1
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let (m,n) = queue.removeFirst()
                for d: Coords in [(-1, 0), (1, 0), (0, -1), (0, 1)] {
                    let x = (m + d.x), y = (n + d.y)
                    if x < 0 || x >= rows || y < 0 || y >= cols || mat[x][y] != -1 { continue }
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
