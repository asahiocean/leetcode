import Foundation

// 216. Combination Sum III
// https://leetcode.com/problems/combination-sum-iii/

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        let cands = [Int](1...9)
        var res: [[Int]] = [], path: [Int] = []
        dfs(&res, &path, cands, n, 0, k)
        return res
    }
    
    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ cands: [Int], _ targ: Int, _ i: Int, _ size: Int) {
        let lnp = path.count, lnc = cands.count
        
        if targ == 0 && lnp == size {
            res.append(Array(path))
            return
        }
        
        guard lnp < size else { return }
        
        for i in i..<lnc {
            let cand = cands[i]
            guard cand <= targ else { break }
            path.append(cand)
            dfs(&res, &path, cands, targ - cand, i + 1, size)
            path.removeLast()
        }
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.021 (0.023) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 1 + 2 + 4 = 7
    // There are no other valid combinations.
    func test0() {
        let value = solution.combinationSum3(3, 7)
        XCTAssertEqual(value, [[1,2,4]])
    }
    
    // 1 + 2 + 6 = 9
    // 1 + 3 + 5 = 9
    // 2 + 3 + 4 = 9
    // There are no other valid combinations.
    func test1() {
        let value = solution.combinationSum3(3, 9)
        XCTAssertEqual(value, [[1,2,6],[1,3,5],[2,3,4]])
    }
    
    // There are no valid combinations.
    // Using 4 different numbers in the range [1,9], the smallest sum
    // we can get is 1+2+3+4 = 10 and since 10 > 1, there are no valid combination.
    func test2() {
        let value = solution.combinationSum3(4, 1)
        XCTAssertEqual(value, [])
    }
}

Tests.defaultTestSuite.run()
