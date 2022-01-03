import Foundation

// 78. Subsets
// https://leetcode.com/problems/subsets/

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [[]] }
        
        var result: [[Int]] = [[]]
        nums.forEach({
            for i in stride(from: 0, to: result.count, by: 1) {
                var subset = result[i]
                subset.append($0)
                result.append(subset)
            }
        })
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.subsets([1,2,3])
        XCTAssertEqual(value, [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]])
    }
    
    func test1() {
        let value = solution.subsets([0])
        XCTAssertEqual(value, [[],[0]])
    }
}

Tests.defaultTestSuite.run()
