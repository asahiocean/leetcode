import Foundation

// 51. N-Queens
// https://leetcode.com/problems/n-queens/

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [[Int]]()
        
        func backtrack(_ p: [Int] = []) {
            if p.count == n { res.append(p) }
            var pth = p, avb = Set<Int>(0..<n)
            for (i,n) in pth.enumerated() {
                if let idx = avb.firstIndex(of: n - pth.count + i) { avb.remove(at: idx) }
                if let idx = avb.firstIndex(of: n) { avb.remove(at: idx) }
                if let idx = avb.firstIndex(of: n + pth.count - i) { avb.remove(at: idx) }
            }
            for i in 0..<n where avb.contains(i) {
                pth.append(i)
                backtrack(pth)
                pth.remove(at: pth.count - 1)
            }
        }
        backtrack()
        return res.map { $0.map { i in (0..<n).map { j in (i == j ? "Q" : ".") }.joined() }}
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.023 (0.025) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let res = solution.solveNQueens(4)
        XCTAssertEqual(res, [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]])
    }
    
    func test1() {
        let res = solution.solveNQueens(1)
        XCTAssertEqual(res, [["Q"]])
    }
}

Tests.defaultTestSuite.run()
