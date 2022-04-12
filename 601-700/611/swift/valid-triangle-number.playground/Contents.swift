import Foundation

// 611. Valid Triangle Number
// https://leetcode.com/problems/valid-triangle-number/

class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        if nums.count < 3 { return 0 }
        let srt = nums.sorted()
        var val = 0
        for i in (2..<srt.count).reversed() {
            var lhs = 0, rhs = i - 1
            while lhs < rhs {
                if srt[lhs] + srt[rhs] > srt[i] {
                    val += rhs - lhs
                    rhs -= 1
                } else {
                    lhs += 1
                }
            }
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // Valid combinations are:
    // 2,3,4 (using the first 2)
    // 2,3,4 (using the second 2)
    // 2,2,3
    func test0() {
        let value = solution.triangleNumber([2,2,3,4])
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.triangleNumber([4,2,3,4])
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()
