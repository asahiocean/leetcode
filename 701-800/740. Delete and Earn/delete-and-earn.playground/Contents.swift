import Foundation

// 740. Delete and Earn
// https://leetcode.com/problems/delete-and-earn/

class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        
        var values = [Int:Int]()
        
        for n in nums { values[n, default: 0] += n }
        
        var prev = 0, curr = 0
        
        for n in values.keys.sorted() {
            if values[n - 1] == nil {
                prev = curr
                curr += values[n, default: 0]
            } else {
                let tmp = max(values[n, default: 0] + prev, curr)
                prev = curr
                curr = tmp
            }
        }
        return curr
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// You can perform the following operations:
    /// - Delete 4 to earn 4 points. Consequently, 3 is also deleted. nums = [2].
    /// - Delete 2 to earn 2 points. nums = [].
    /// You earn a total of 6 points.
    func test0() {
        let value = solution.deleteAndEarn([3,4,2])
        XCTAssertEqual(value, 6)
    }
    
    /// You can perform the following operations:
    /// - Delete a 3 to earn 3 points. All 2's and 4's are also deleted. nums = [3,3].
    /// - Delete a 3 again to earn 3 points. nums = [3].
    /// - Delete a 3 once more to earn 3 points. nums = [].
    /// You earn a total of 9 points.
    func test1() {
        let value = solution.deleteAndEarn([2,2,3,3,3,4])
        XCTAssertEqual(value, 9)
    }
}

Tests.defaultTestSuite.run()
