import Foundation

// 39. Combination Sum
// https://leetcode.com/problems/combination-sum/

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combination = [Int](), uniques = [[Int]]()
        dfs(candidates.sorted(), target, 0, &uniques, &combination)
        return uniques
    }
    
    private func dfs(_ cands: [Int], _ t: Int, _ idx: Int, _ uniq: inout [[Int]], _ comb: inout [Int]) {
        guard t > 0 else {
            uniq.append(comb)
            return
        }
        for i in idx..<cands.count where cands[i] <= t {
            comb.append(cands[i])
            dfs(cands, t - cands[i], i, &uniq, &comb)
            comb.removeLast()
        }
    }
}

// MARK: - Test cases -

// Result: Executed 5 tests, with 0 failures (0 unexpected) in 0.039 (0.041) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.combinationSum([2,3,6,7], 7)
        XCTAssertEqual(value, [[2,2,3],[7]])
    }
    func test1() {
        let value = solution.combinationSum([2,3,5], 8)
        XCTAssertEqual(value, [[2,2,2,2],[2,3,3],[3,5]])
    }
    func test2() {
        let value = solution.combinationSum([2], 1)
        XCTAssertEqual(value, [])
    }
    func test3() {
        let value = solution.combinationSum([1], 1)
        XCTAssertEqual(value, [[1]])
    }
    func test4() {
        let value = solution.combinationSum([1], 2)
        XCTAssertEqual(value, [[1,1]])
    }
}

Tests.defaultTestSuite.run()
