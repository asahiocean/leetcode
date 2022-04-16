import Foundation

// 1283. Find the Smallest Divisor Given a Threshold
// https://leetcode.com/problems/find-the-smallest-divisor-given-a-threshold/

class Solution {
    func smallestDivisor(_ nums: [Int], _ t: Int) -> Int {
        let srt = nums.map { Double($0) }
        var lhs = 1, rhs = nums.max()!

        while lhs < rhs {
            let mid = lhs + (rhs - lhs) >> 1
            if srt.map({ Int(ceil($0/Double(mid))) }).reduce(0,+) > t {
                lhs = mid + 1
            } else {
                rhs = mid
            }
        }
        return lhs
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // We can get a sum to 17 (1+2+5+9) if the divisor is 1.
    // If the divisor is 4 we can get a sum of 7 (1+1+2+3) and if the divisor
    // is 5 the sum will be 5 (1+1+1+2).
    func test0() {
        let value = solution.smallestDivisor([1,2,5,9],6)
        XCTAssertEqual(value, 5)
    }
    
    func test1() {
        let value = solution.smallestDivisor([44,22,33,11,1],5)
        XCTAssertEqual(value, 44)
    }
}

Tests.defaultTestSuite.run()
