import Foundation

// 47. Permutations II
// https://leetcode.com/problems/permutations-ii/

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]](), path = [Int](), visited = [Bool](repeating: false, count: nums.count)
        dfs(&res, &path, nums.sorted(by: <), &visited)
        return res
    }
    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ nums: [Int], _ visited: inout [Bool]) {
        guard path.count != nums.count else { res.append(path); return }
        for n in 0..<nums.count {
            if visited[n] || (n > 0 && nums[n] == nums[n-1] && visited[n-1]) { continue }
            path.append(nums[n])
            visited[n] = true
            dfs(&res, &path, nums, &visited)
            visited[n] = false
            path.removeLast()
        }
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.095 (0.097) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.permuteUnique([1,1,2])
        XCTAssertEqual(res, [[1,1,2],[1,2,1],[2,1,1]])
    }
    func test1() {
        let res = s.permuteUnique([1,2,3])
        XCTAssertEqual(res, [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]])
    }
}

Tests.defaultTestSuite.run()
