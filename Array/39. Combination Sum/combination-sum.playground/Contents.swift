import Foundation

// 39. Combination Sum
// https://leetcode.com/problems/combination-sum/
// Discuss: https://vk.cc/c4a92w

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combination = [Int](), uniques = [[Int]]()
        dfs(candidates.sorted(), target, 0, &uniques, &combination)
        return uniques
    }
    
    private func dfs(_ candidates: [Int], _ t: Int, _ index: Int, _ uniques: inout [[Int]], _ comb: inout [Int]) {
        guard t > 0 else {
            uniques.append(comb)
            return
        }
        
        for i in index..<candidates.count where candidates[i] <= t {
            comb.append(candidates[i])
            dfs(candidates, t - candidates[i], i, &uniques, &comb)
            comb.removeLast()
        }
    }
}

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.113 (0.115) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.combinationSum([2,3,6,7], 7)
        XCTAssertEqual(res, [[2,2,3],[7]])
    }
    func test1() {
        let res = s.combinationSum([2,3,5], 8)
        XCTAssertEqual(res, [[2,2,2,2],[2,3,3],[3,5]])
    }
    func test2() {
        let res = s.combinationSum([2], 1)
        XCTAssertEqual(res, [])
    }
    func test3() {
        let res = s.combinationSum([1], 1)
        XCTAssertEqual(res, [[1]])
    }
    func test4() {
        let res = s.combinationSum([1], 2)
        XCTAssertEqual(res, [[1,1]])
    }
}

Tests.defaultTestSuite.run()
