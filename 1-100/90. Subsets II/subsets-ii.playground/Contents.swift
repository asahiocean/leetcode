import Foundation

// 90. Subsets II
// https://leetcode.com/problems/subsets-ii/

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]](), path: [Int] = []
        dfs(&result, &path, nums.sorted(by: <))
        return result
    }
    private func dfs(_ result: inout [[Int]], _ path: inout [Int], _ nums: [Int], _ index: Int = 0) {
        result.append(path)
        for i in index..<nums.count {
            if i > 0 && nums[i] == nums[i - 1] && i != index { continue }
            path.append(nums[i])
            dfs(&result, &path, nums, i + 1)
            path.removeLast()
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.subsetsWithDup([1,2,2])
        XCTAssertEqual(value, [[],[1],[1,2],[1,2,2],[2],[2,2]])
    }
    func test1() {
        let value = solution.subsetsWithDup([0])
        XCTAssertEqual(value, [[],[0]])
    }
}

Tests.defaultTestSuite.run()
