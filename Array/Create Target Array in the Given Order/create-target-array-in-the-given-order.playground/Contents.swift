import Foundation

// 1389. Create Target Array in the Given Order
// https://leetcode.com/problems/create-target-array-in-the-given-order/

class Solution {
    func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
        var result = [Int]()
        for i in 0..<nums.count { result.insert(nums[i], at: index[i]) }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.createTargetArray([0,1,2,3,4],[0,1,2,2,1])
        XCTAssertEqual(value, [0,4,1,3,2])
    }
    func test1() {
        let value = solution.createTargetArray([1,2,3,4,0],[0,1,2,3,0])
        XCTAssertEqual(value, [0,1,2,3,4])
    }
    func test2() {
        let value = solution.createTargetArray([1],[0])
        XCTAssertEqual(value, [1])
    }
}

Tests.defaultTestSuite.run()
