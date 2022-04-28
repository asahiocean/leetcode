import Foundation

// 1901. Find a Peak Element II
// https://leetcode.com/problems/find-a-peak-element-ii/

class Solution {
    func findPeakGrid(_ mat: [[Int]]) -> [Int] {
        let row = mat.count, col = mat[0].count
        var i = 0, j = 0
        while true {
            let x = mat[i][j], mi = mat[i]
            if i + 1 < row && mat[i+1][j] > x { i += 1; continue }
            if i - 1 >= 0 && mat[i-1][j] > x { i -= 1; continue }
            if j + 1 < col && mi[j+1] > x { j += 1; continue }
            if j - 1 >= 0 && mi[j-1] > x { j -= 1; continue }
            break
        }
        return [i,j]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.findPeakGrid([[1,4],[3,2]])
        XCTAssertEqual(res, [1,0])
    }
    
    func test1() {
        let res = solution.findPeakGrid([[10,20,15],[21,30,14],[7,16,32]])
        XCTAssertEqual(res, [1,1])
    }
}

Tests.defaultTestSuite.run()
