import Foundation

// 59. Spiral Matrix II
// https://leetcode.com/problems/spiral-matrix-ii/

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        let map = [Int](repeating: -1, count: n)
        var res = [[Int]](repeating: map, count: n)
        let grid = (n * n)
        var top = 0, btm = n - 1, lhs = 0, rhs = (n - 1)
        var elm = 1
        
        while elm <= grid {
            if lhs <= rhs && elm <= grid { // left -> right
                for i in lhs...rhs {
                    res[top][i] = elm
                    elm += 1
                }
                top += 1
            }
            if top <= btm && elm <= grid { // top -> bottom
                for i in top...btm {
                    res[i][rhs] =  elm
                    elm += 1
                }
                rhs -= 1
            }
            if lhs <= rhs && elm <= grid { // right -> left
                for i in (lhs...rhs).reversed() {
                    res[btm][i] = elm
                    elm +=  1
                }
                btm -= 1
            }
            if top <= btm && elm <= grid { // bottom -> top
                for i in (top...btm).reversed() {
                    res[i][lhs] = elm
                    elm += 1
                }
                lhs += 1
            }
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.generateMatrix(3)
        XCTAssertEqual(value, [[1,2,3],[8,9,4],[7,6,5]])
    }
    
    func test1() {
        let value = solution.generateMatrix(1)
        XCTAssertEqual(value, [[1]])
    }
}

Tests.defaultTestSuite.run()
