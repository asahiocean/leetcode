import Foundation

// 39. Combination Sum
// https://leetcode.com/problems/combination-sum/

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var uniqs: [[Int]] = [], comb: [Int] = []
        let cands = candidates.sorted()
        dfs(&uniqs, &comb, cands, target)
        return uniqs
    }
    
    private func dfs(_ uniqs: inout [[Int]], _ comb: inout [Int], _ cands: [Int], _ targ: Int, _ idx: Int = 0) {
        guard targ > 0 else { uniqs.append(comb); return }
        for i in idx..<cands.count where cands[i] <= targ {
            comb.append(cands[i])
            dfs(&uniqs, &comb, cands, targ - cands[i], i)
            comb.removeLast()
        }
    }
}

// MARK: - Test cases -

// Result: Executed 5 tests, with 0 failures (0 unexpected) in 0.039 (0.041) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
    /// 7 is a candidate, and 7 = 7.
    /// These are the only two combinations.
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
