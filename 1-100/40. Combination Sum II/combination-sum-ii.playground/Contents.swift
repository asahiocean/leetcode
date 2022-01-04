import Foundation

// 40. Combination Sum II
// https://leetcode.com/problems/combination-sum-ii/

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]](), path = [Int](), sorted = candidates.sorted()
        dfs(&result, &path, target, sorted, 0)
        return result
    }
    
    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ trg: Int, _ cands: [Int], _ idx: Int) {
        guard trg > 0 else { res.append(path); return }
        
        for k in idx..<cands.count where cands[k] <= trg {
            if k > 0 && cands[k] == cands[k-1] && k != idx { continue }
            path.append(cands[k])
            dfs(&res, &path, trg - cands[k], cands, k + 1)
            path.removeLast()
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.combinationSum2([10,1,2,7,6,1,5], 8)
        XCTAssertEqual(value, [[1,1,6],[1,2,5],[1,7],[2,6]])
    }
    func test1() {
        let value = solution.combinationSum2([2,5,2,1,2], 5)
        XCTAssertEqual(value, [[1,2,2],[5]])
    }
}

Tests.defaultTestSuite.run()
