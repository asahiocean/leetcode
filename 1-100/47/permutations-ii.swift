import Foundation

// 47. Permutations II
// https://leetcode.com/problems/permutations-ii/

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]](), path = [Int](), vis = [Bool](repeating: false, count: nums.count)
        dfs(&res, &path, &vis, nums.sorted(by: <))
        return res
    }
    private func dfs(_ r: inout [[Int]], _ p: inout [Int], _ v: inout [Bool], _ n: [Int]) {
        guard p.count != n.count else { r.append(p); return }
        for i in 0..<n.count {
            if v[i] || (i > 0 && n[i] == n[i-1] && v[i-1]) { continue }
            p.append(n[i])
            v[i] = true
            dfs(&r, &p, &v, n)
            p.removeLast()
            v[i] = false
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.025 (0.027) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.permuteUnique([1,1,2])
        XCTAssertEqual(value, [[1,1,2],[1,2,1],[2,1,1]])
    }
    func test1() {
        let value = solution.permuteUnique([1,2,3])
        XCTAssertEqual(value, [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]])
    }
}

Tests.defaultTestSuite.run()
