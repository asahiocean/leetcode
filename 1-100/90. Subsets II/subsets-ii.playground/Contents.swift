import Foundation

// 90. Subsets II
// https://leetcode.com/problems/subsets-ii/

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]](), path = [Int]()
        let nums = nums.sorted(by: <)
        func dfs(_ res: inout [[Int]], _ path: inout [Int], _ nums: [Int], _ index: Int) {
            res.append(path)
            for i in index..<nums.count {
                if i > 0 && nums[i] == nums[i - 1] && i != index { continue }
                path.append(nums[i])
                dfs(&res, &path, nums, i + 1)
                path.removeLast()
            }
        }
        dfs(&res, &path, nums, 0)
        return res
    }
}

import XCTest

//     Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.subsetsWithDup([1,2,2])
        XCTAssertEqual(res, [[],[1],[1,2],[1,2,2],[2],[2,2]])
    }
    func test1() {
        let res = s.subsetsWithDup([0])
        XCTAssertEqual(res, [[],[0]])
    }
}

Tests.defaultTestSuite.run()
