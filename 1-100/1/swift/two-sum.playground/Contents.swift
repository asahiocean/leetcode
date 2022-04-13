import Foundation

// 1. Two Sum
// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ n: [Int], _ t: Int) -> [Int] {
        var dict = [Int:Int]()
        for (i, n) in n.enumerated() {
            if let val = dict[t-n] { return [val, i] }
            dict[n] = i
        }
        return []
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Because nums[0] + nums[1] == 9, we return [0, 1].
    func test0() {
        let value = solution.twoSum([2,7,11,15], 9)
        XCTAssertEqual(value, [0,1])
    }
    func test1() {
        let value = solution.twoSum([3,2,4], 6)
        XCTAssertEqual(value, [1,2])
    }
    func test2() {
        let value = solution.twoSum([3,3], 6)
        XCTAssertEqual(value, [0,1])
    }
}

Tests.defaultTestSuite.run()
