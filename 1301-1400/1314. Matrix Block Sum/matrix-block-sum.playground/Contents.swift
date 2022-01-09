import Foundation

// 1314. Matrix Block Sum
// https://leetcode.com/problems/matrix-block-sum/

class Solution {
    func matrixBlockSum(_ mat: [[Int]], _ k: Int) -> [[Int]] {
        let rows = mat.count, cols = mat[0].count
        var pre = [[Int]](repeating: [Int](repeating: 0, count: cols + 1), count: rows + 1)
        var val = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        for r in 1...rows {
            for c in 1...cols {
                pre[r][c] = pre[r-1][c] + pre[r][c-1] - pre[r-1][c-1] + mat[r-1][c-1]
            }
        }
        for r in 1...rows {
            for c in 1...cols {
                let lx = max(1, r - k),
                    ly = max(1, c - k),
                    rx = min(rows, r + k),
                    ry = min(cols, c + k)
                val[r-1][c-1] = pre[rx][ry] + pre[lx-1][ly-1] - pre[rx][ly-1] - pre[lx-1][ry]
            }
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.matrixBlockSum([[1,2,3],[4,5,6],[7,8,9]], 1)
        XCTAssertEqual(value, [[12,21,16],[27,45,33],[24,39,28]])
    }
    
    func test1() {
        let value = solution.matrixBlockSum([[1,2,3],[4,5,6],[7,8,9]], 2)
        XCTAssertEqual(value, [[45,45,45],[45,45,45],[45,45,45]])
    }
}

Tests.defaultTestSuite.run()
