import Foundation

// 179. Largest Number
// https://leetcode.com/problems/largest-number/

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let result = nums.map { String($0) }.sorted(by: { ($0 + $1) > ($1 + $0) }).joined()
        return result.first == "0" ? "0" : result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.largestNumber([10,2])
        XCTAssertEqual(value, "210")
    }
    
    func test1() {
        let value = solution.largestNumber([3,30,34,5,9])
        XCTAssertEqual(value, "9534330")
    }
}

Tests.defaultTestSuite.run()
