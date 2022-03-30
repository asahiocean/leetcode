import Foundation

// 40. Combination Sum II
// https://leetcode.com/problems/combination-sum-ii/

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var path: [Int] = [], result: [[Int]] = []
        dfs(&result, &path, candidates.sorted(), target)
        return result
    }
    
    private func dfs(_ res: inout [[Int]], _ p: inout [Int], _ c: [Int], _ t: Int, _ id: Int = 0) {
        guard t > 0 else { res.append(p); return }
        for k in id..<c.count where c[k] <= t {
            if k > 0 && c[k] == c[k-1] && k != id { continue }
            p.append(c[k])
            dfs(&res, &p, c, t - c[k], k + 1)
            p.removeLast()
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
        XCTAssertEqual(value, [[1,1,6],
                               [1,2,5],
                               [1,7],
                               [2,6]])
    }
    func test1() {
        let value = solution.combinationSum2([2,5,2,1,2], 5)
        XCTAssertEqual(value, [[1,2,2],[5]])
    }
}

Tests.defaultTestSuite.run()
